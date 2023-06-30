<?php


namespace app\admin\controller\mall;


use app\common\model\MallGoodsCategory;
use app\admin\traits\Curd;
use app\common\controller\AdminController;
use EasyAdmin\annotation\ControllerAnnotation;
use EasyAdmin\annotation\NodeAnotation;
use think\App;

/**
 * Class Admin
 * @package app\admin\controller\mall
 * @ControllerAnnotation(title="商品分类管理")
 */
class GoodsCategory extends AdminController
{

    use Curd;

    public function initialize()
    {
        parent::initialize();
        $this->model = new MallGoodsCategory();
    }

    /**
     * @NodeAnotation(title="添加")
     */
    public function add($id = null)
    {
        if ($this->request->isPost()) {
            $post = $this->request->post();
            $rule = [
                'pid|上级菜单'   => 'require',
                'category_name|菜单名称' => 'require',
            ];
            $this->validate($post, $rule);
            try {
                $save = $this->model->save($post);
            } catch (\Exception $e) {
                $this->error('保存失败');
            }
            if ($save) {
                $this->success('保存成功');
            } else {
                $this->error('保存失败');
            }
        }
        $pidMenuList = $this->model->getPidMenuList();
        $this->assign('id', $id);
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
            $rule = [
                'pid|上级菜单'   => 'require',
                'category_name|菜单名称' => 'require',
            ];
            $this->validate($post, $rule);
            try {
                $save = $row->save($post);
            } catch (\Exception $e) {
                $this->error('保存失败');
            }
            if ($save) {
                $this->success('保存成功');
            } else {
                $this->error('保存失败');
            }
        }
        $pidMenuList = $this->model->getPidMenuList();
        dump($pidMenuList);
        $this->assign([
            'id'          => $id,
            'pidMenuList' => $pidMenuList,
            'row'         => $row,
        ]);
        return $this->fetch();
    }

}
