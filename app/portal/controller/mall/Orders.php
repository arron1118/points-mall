<?php
/**
 * copyright@Administrator
 * 2023/8/1 0001 10:54
 * email:arron1118@icloud.com
 */

namespace app\portal\controller\mall;

use app\common\controller\PortalController;
use app\common\model\MallGoods;
use app\common\model\MallGoodsSpecs;
use app\common\model\MallOrders;

class Orders extends PortalController
{

    protected function initialize()
    {
        parent::initialize();

        $this->model = new MallOrders();
    }

    public function index()
    {
        $param = $this->request->param();

        if (!$param['goods_id']) {
            $this->error('参数错误');
        }

        return $this->view->fetch();
    }

    public function getGoodsDetail()
    {
        $param = $this->request->param();
        $goods_specs_id = $param['goods_specs_id'];

        $goods = MallGoods::with(['goodsSpecs' => function ($query) use ($goods_specs_id) {
            $query->where('id', $goods_specs_id);
        }])->find($param['goods_id']);

        $address = [];
        $default_address = '';
        foreach ($this->userInfo->address as $val) {
            $add = $val['receiver_province'] . $val['receiver_city'] . $val['receiver_district'] . $val['receiver_address'];
            $address[] = [
                'is_default' => $val['is_default'],
                'address' => $add,
            ];

            if ($val['is_default'] === 1) {
                $default_address = $add;
            }
        }

        $this->success('success', [
            'goods' => $goods,
            'quantity' => $param['quantity'],
            'address' => $address,
            'default_address' => $default_address,
        ]);
    }

    public function createOrder()
    {

    }

}
