<?php
/**
 * copyright@Administrator
 * 2023/6/27 0027 17:39
 * email:arron1118@icloud.com
 */

namespace app\admin\controller\mall;

use app\admin\traits\Curd;
use app\common\model\MallGoodsSkuAttributeKeys;
use app\common\model\MallGoodsSkuAttributeValues;
use EasyAdmin\annotation\NodeAnotation;

class GoodsSkuAttributeValues extends \app\common\controller\AdminController
{

    use Curd;

    protected function initialize()
    {
        parent::initialize();

        $this->model = new MallGoodsSkuAttributeValues();
    }

    /**
     * @NodeAnotation(title="列表")
     */
    public function index()
    {
        if ($this->request->isAjax()) {
            if (input('selectFields')) {
                return $this->selectList();
            }
            [$page, $limit, $where] = $this->buildTableParames();
            $count = $this->model->with(['attributeKey'])
                ->where($where)
                ->count();
            $list = $this->model->with(['attributeKey'])
                ->where($where)
                ->page($page, $limit)
                ->order($this->sort)
                ->select();
            $data = [
                'code'  => 0,
                'msg'   => '',
                'count' => $count,
                'data'  => $list,
            ];
            return json($data);
        }
        return $this->fetch();
    }

    /**
     * @NodeAnotation(title="添加")
     */
    public function add($id = null)
    {
        if ($this->request->isPost()) {
            $post = $this->request->post();
            if ($post['sku_attribute_id'] <= 0) {
                $this->error('请选择属性类型');
            }

            $cate = $this->model->where(['sku_attribute_value' => $post['sku_attribute_value']])->findOrEmpty();
            if (!$cate->isEmpty()) {
                $this->error('名称已经存在');
            }

            $rule = [];
            $this->validate($post, $rule);
            try {
                $save = $this->model->save($post);
            } catch (\Exception $e) {
                $this->error('保存失败:'.$e->getMessage());
            }
            $save ? $this->success('保存成功') : $this->error('保存失败');
        }
        $pidMenuList = (new MallGoodsSkuAttributeKeys())->getAttributeKeysList();
        $this->assign('pidMenuList', $pidMenuList);
        return $this->fetch();
    }

    /**
     * @NodeAnotation(title="编辑")
     */
    public function edit($id)
    {
        $row = $this->model->find($id);
        empty($row) && $this->error('数据不存在');
        if ($this->request->isPost()) {
            $post = $this->request->post();
            if ($post['sku_attribute_id'] <= 0) {
                $this->error('请选择商品分类');
            }

            $cate = $this->model->where([
                ['sku_attribute_value', '=', $post['sku_attribute_value']],
                ['id', '<>', $id],
            ])->findOrEmpty();
            if (!$cate->isEmpty()) {
                $this->error('名称已经存在');
            }
            $rule = [];
            $this->validate($post, $rule);
            try {
                $save = $row->save($post);
            } catch (\Exception $e) {
                $this->error('保存失败');
            }
            $save ? $this->success('保存成功') : $this->error('保存失败');
        }
        $pidMenuList = (new MallGoodsSkuAttributeKeys())->getAttributeKeysList();
        $this->assign('pidMenuList', $pidMenuList);
        $this->assign('row', $row);
        return $this->fetch();
    }

}
