<?php


namespace app\company\controller\mall;


use app\common\model\MallGoods;
use app\common\model\MallGoodsCategory;
use app\admin\traits\Curd;
use app\common\controller\CompanyController;
use app\common\model\MallGoodsCompanyAttributes;
use app\common\model\MallGoodsSkuAttributeKeys;
use app\common\model\MallGoodsSpecs;
use EasyAdmin\annotation\ControllerAnnotation;
use EasyAdmin\annotation\NodeAnotation;
use think\App;
use think\db\Query;

/**
 * Class Goods
 * @package app\company\controller\mall
 * @ControllerAnnotation(title="商城商品管理")
 */
class Goods extends CompanyController
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
            $get = $this->request->get();
            $page = isset($get['page']) && !empty($get['page']) ? $get['page'] : 1;
            $limit = isset($get['limit']) && !empty($get['limit']) ? $get['limit'] : 10;
            $title = isset($get['title']) && !empty($get['title']) ? $get['title'] : null;
            $count = $this->model
                ->withJoin('category', 'LEFT')
                ->where($where)
                ->where(function (Query $query) use ($title) {
                    !empty($title) && $query->where('title', 'like', "%{$title}%");
                })
                ->count();
            $list = $this->model
                ->withJoin('category', 'LEFT')
                ->where($where)
                ->where(function (Query $query) use ($title) {
                    !empty($title) && $query->where('title', 'like', "%{$title}%");
                })
                ->page($page, $limit)
                ->order($this->sort)
                ->append(['status_text'])
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
                $post['company_id'] = session('company.id');
                $save = $this->model->save($post);

                if ($save && isset($post['attribute_list'])) {
                    $goodsCompanyAttributeModel = new MallGoodsCompanyAttributes();
                    $goodsSpecsModel = new MallGoodsSpecs();
                    $goodsCompanyAttributeData = [];

                    // 更新商家商品属性
                    foreach ($post['goods_attribute_list'] as $key => $value) {
                        foreach ($value as $k => $v) {
                            $goodsCompanyAttributeData[] = [
                                'company_id' => $post['company_id'],
                                'goods_id' => $this->model->id,
                                'sku_attribute_key_id' => $key,
                                'sku_attribute_value_id' => $k,
                                'sku_attribute_value' => $v['sku_attribute_value'],
                            ];
                        }
                    }
                    $goodsCompanyAttributeModel->saveAll($goodsCompanyAttributeData);

                    // 更新sku表
                    foreach ($post['specs_list'] as $key => &$val) {
                        $val['goods_id'] = $this->model->id;
                    }
                    $goodsSpecsModel->saveAll($post['specs_list']);
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
        $row = $this->model->with([
            'companyAttributes' => function ($query) {
                return $query->field('id, goods_id, sku_attribute_key_id, sku_attribute_value_id, sku_attribute_value');
            },
            'goodsSpecs' => function ($query) {
                return $query->field('id, goods_id, specs_list, market_price, discount_price, integral, stock');
            }
        ])->find($id);

        empty($row) && $this->error('数据不存在');
        if ($this->request->isPost()) {
            $post = $this->request->post();
            $rule = [];
            $this->validate($post, $rule);
            $return = [];
            try {
                $save = $row->save($post);

                if ($save) {
                    $row = $row->toArray();

                    $goodsCompanyAttributeModel = new MallGoodsCompanyAttributes();
                    $goodsSpecsModel = new MallGoodsSpecs();
                    $goodsCompanyAttributeData = [];

                    if (isset($post['attribute_list'])) {
                        // 更新商家商品属性
                        foreach ($post['goods_attribute_list'] as $key => $value) {
                            $attr = array_diff(array_column($row['companyAttributes'], 'id'), array_column($value, 'id'));
                            $return['attr'] = $attr;
                            $attr && MallGoodsCompanyAttributes::destroy(array_values($attr), true);
                            foreach ($value as $k => $v) {
                                if (isset($v['id'])) {
                                    $goodsCompanyAttributeData[] = $v;
                                } else {
                                    $goodsCompanyAttributeData[] = [
                                        'company_id' => $row['company_id'],
                                        'goods_id' => $row['id'],
                                        'sku_attribute_key_id' => $key,
                                        'sku_attribute_value_id' => $k,
                                        'sku_attribute_value' => $v['sku_attribute_value'],
                                    ];
                                }
                            }
                        }
                        $goodsCompanyAttributeModel->saveAll($goodsCompanyAttributeData);

                        // 更新sku表
                        $specs = array_diff(array_column($row['goodsSpecs'], 'id'), array_column($post['specs_list'], 'id'));
                        $return['specs'] = $specs;
                        $specs && MallGoodsSpecs::destroy(array_values($specs), true);
                        foreach ($post['specs_list'] as $key => &$val) {
                            if (!isset($val['id'])) {
                                $val['goods_id'] = $row['id'];
                            }
                        }
                        $goodsSpecsModel->saveAll($post['specs_list']);
                    } elseif ($row['companyAttributes']) {
                        MallGoodsCompanyAttributes::destroy(array_column($row['companyAttributes'], 'id'), true);
                        MallGoodsSpecs::destroy(array_column($row['goodsSpecs'], 'id'), true);
                    }
                }
            } catch (\Exception $e) {
                $this->error($e->getMessage());
            }
            $save ? $this->success('保存成功', $return) : $this->error('保存失败');
        }
        $this->assign('row', $row);
        $pidMenuList = (new MallGoodsCategory())->getPidMenuList();
        $this->assign('pidMenuList', $pidMenuList);
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
