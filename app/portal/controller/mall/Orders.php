<?php
/**
 * copyright@Administrator
 * 2023/8/1 0001 10:54
 * email:arron1118@icloud.com
 */

namespace app\portal\controller\mall;

use app\common\controller\PortalController;
use app\common\model\MallGoods;
use app\common\model\MallOrders;
use app\portal\middleware\Auth;

class Orders extends PortalController
{

    protected $middleware = [Auth::class];

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
        $default_address = [];
        foreach ($this->userInfo->address as $val) {
            $add = [
                'id' => $val['id'],
                'address' => $val['receiver_province'] . $val['receiver_city'] . $val['receiver_district'] . $val['receiver_address']
                    . ' ' . $val['receiver_phone'] . ' ' . $val['receiver_name']
            ];
            $address[] = $add;

            if ($val['is_default'] === 1) {
                $default_address = $add;
            }
        }

        $this->success('success', [
            'goods' => $goods,
            'quantity' => $param['quantity'],
            'address' => $address,
            'default_address' => $default_address ?? $address[0],
        ]);
    }

    public function createOrder()
    {
        if ($this->request->isPost()) {
            $param = $this->request->param();
            $goods_specs_id = $param['goods_specs_id'];

            $goods = MallGoods::with(['goodsSpecs' => function ($query) use ($goods_specs_id) {
                $query->where('id', $goods_specs_id);
            }])->find($param['goods_id']);

            if ($goods->total_stock < $param['quantity']) {
                $this->error('库存不足');
            }

            $orderNo = createOrderNo();
            $total_fee = $param['quantity'] * $goods->goodsSpecs[0]->integral;
            $order = [
                'order_no' => $orderNo,
                'user_id' => $this->userInfo->id,
                'company_id' => $goods->company_id,
                'integral' => $total_fee,
                'address_id' => $param['address_id'],
                'address' => $param['address'],
                'pay_time' => time(),
                'status' => 1,
            ];
            if ($this->model->save($order)) {
                foreach ($goods->goodsSpecs as $val) {
                    $orderItems = [
                        'order_no' => $orderNo,
                        'goods_id' => $goods->id,
                        'img' => $goods->logo,
                        'title' => $goods->title,
                        'goods_specs_id' => $val->id,
                        'specs_name' => $val->specs_list,
                        'price' => $val->market_price ?? $goods->market_price,
                        'integral' => $val->integral ?? $goods->integral,
                        'quantity' => $param['quantity']
                    ];
                    $this->model->orderItems()->save($orderItems);

                    // 减库存
                    $val->stock -= $param['quantity'];
                    ++$val->sales;
                    $val->save();
                }

                // 减库存
                $goods->total_stock -= $param['quantity'];
                ++$goods->sales;
                $goods->save();

                // 扣除用户积分
                $this->userInfo->integral -= $total_fee;
                $this->userInfo->save();

                // 积分明细
                $this->userInfo->integralLogs()->save([
                    'integral_amount' => $total_fee,
                    'title' => '兑换商品',
                ]);

                $this->success('下单成功');
            }

            $this->error('下单失败，请稍后再试');
        }
    }

    public function orderSuccess()
    {
        return $this->view->fetch();
    }

    public function checkUserIntegral()
    {
        if ($this->request->isPost()) {
            $param = $this->request->param();

            $this->success('success', $param['integral'] * $param['quantity'] <= $this->userInfo->integral);
        }
    }

}
