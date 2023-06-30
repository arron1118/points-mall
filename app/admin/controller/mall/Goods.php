<?php


namespace app\admin\controller\mall;


use app\common\model\MallGoods;
use app\common\model\MallGoodsCategory;
use app\admin\traits\Curd;
use app\common\controller\AdminController;
use app\common\model\MallGoodsCompanyAttributes;
use app\common\model\MallGoodsSkuAttributeKeys;
use app\common\model\MallGoodsSpecs;
use EasyAdmin\annotation\ControllerAnnotation;
use EasyAdmin\annotation\NodeAnotation;
use think\App;

/**
 * Class Goods
 * @package app\admin\controller\mall
 * @ControllerAnnotation(title="商城商品管理")
 */
class Goods extends AdminController
{

    use Curd;

    protected $relationSearch = true;

    public function initialize()
    {
        parent::initialize();
        $this->model = new MallGoods();
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
            $count = $this->model
                ->withJoin('category', 'LEFT')
                ->where($where)
                ->count();
            $list = $this->model
                ->withJoin('category', 'LEFT')
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
    public function add()
    {
        if ($this->request->isPost()) {
            $post = $this->request->post();
            $rule = [];
            $this->validate($post, $rule);
            try {
//                $save = $this->model->save($post);
                $save = false;

                if ($save) {

                    $attributes = $specs = [];
                    $goodsCompanyAttributeModel = MallGoodsCompanyAttributes::class;
                    $goodsSpecsModel = MallGoodsSpecs::class;
                    $goodsCompanyAttributeData = $goodsSpecsData = [];

                    // 更新商家商品属性
                    foreach ($post['goods_attribute_list'] as $key => $value) {
                        $value['value_id'] = array_values($value['value_id']);
                        foreach ($value['value_id'] as $k => $v) {
                            $goodsCompanyAttributeData[] = [
                                'company_id' => session('admin.id'),
                                'goods_id' => $this->model->id,
                                'sku_attribute_key_id' => $key,
                                'sku_attribute_value_id' => $v,
                                'sku_attribute_value' => $value['value_name'][$k],
                            ];
                        }
                    }
                    $goodsCompanyAttributeModel::saveAll($goodsCompanyAttributeData);

                    // 更新sku表
                    foreach ($post['attribute_list'] as $k => $v) {
                        foreach ($post['specs_list']['stocks'] as $key => $val) {
                            $goodsSpecsData[] = [
                                'goods_id' => $this->model->id,
                                'market_price' => $post['specs_list']['market_prices'][$key],
                                'discount_price' => $post['specs_list']['discount_prices'][$key],
                                'integral' => $post['specs_list']['integrals'][$key],
                                'stock' => $val,
                                'specs_list'
                            ];
                        }
                    }
                }

            } catch (\Exception $e) {
                $this->error('保存失败:'.$e->getMessage());
            }
            $save ? $this->success('保存成功') : $this->error('保存失败', $post);
        }
        $pidMenuList = (new MallGoodsCategory())->getPidMenuList();
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
            $rule = [];
            $this->validate($post, $rule);
            try {
                $save = $row->save($post);
            } catch (\Exception $e) {
                $this->error('保存失败');
            }
            $save ? $this->success('保存成功') : $this->error('保存失败');
        }
        $this->assign('row', $row);
        return $this->fetch();
    }

    /**
     * @NodeAnotation(title="入库")
     */
    public function stock($id)
    {
        $row = $this->model->find($id);
        empty($row) && $this->error('数据不存在');
        if ($this->request->isPost()) {
            $post = $this->request->post();
            $rule = [];
            $this->validate($post, $rule);
            try {
                $post['total_stock'] = $row->total_stock;
                $save = $row->save($post);
            } catch (\Exception $e) {
                $this->error('保存失败');
            }
            $save ? $this->success('保存成功') : $this->error('保存失败');
        }
        $this->assign('row', $row);
        return $this->fetch();
    }

    /**
     * @param $category_id
     * @return \think\response\Json|void
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     * @NodeAnotation(title="获取商品属性")
     */
    public function getAttributes($category_id = null)
    {
        if ($this->request->isPost()) {
            !$category_id && $this->error('请选择正确的分类');

            $attributes = MallGoodsSkuAttributeKeys::with(['attributeValues' => function ($query) {
                return $query->field('id, sku_attribute_id, sku_attribute_value, sub_sku_attribute_value, remark')
                    ->order('sort desc');
            }])
                ->field('id, sku_attribute_name, remark')
                ->where(['category_id' => $category_id])
                ->select();

            $data = [
                'code'  => 1,
                'msg'   => '',
                'data'  => $attributes,
            ];

            return json($data);
        }
    }

}
