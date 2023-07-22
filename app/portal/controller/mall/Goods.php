<?php
/**
 * copyright@Administrator
 * 2023/7/20 0020 15:21
 * email:arron1118@icloud.com
 */

namespace app\portal\controller\mall;

use app\common\model\MallGoods;
use app\common\model\MallGoodsSpecs;

class Goods extends \app\common\controller\PortalController
{

    public function initialize()
    {
        parent::initialize();

        $this->model = new MallGoods();
    }

    public function detail($id = 0)
    {
        if (!$id) {
            return redirect((string) url('/error'));
        }

        return $this->view->fetch();
    }

    public function getDetail($id = 0)
    {
        if (!$id) {
            $this->error('参数错误');
        }

        $goods = MallGoods::with(['goodsSpecs'])
            ->where('status', 1)
            ->find($id);

        if (!$goods) {
            $this->error('商品已经下架或者不存在');
        }

        $goods['detail'] = htmlspecialchars_decode($goods['detail']);
        $specs = $this->request->param('specs', '');
        if ($specs) {
            $specsInfo = MallGoodsSpecs::where([
                'goods_id' => $id,
                'specs_list' => json_encode(["$specs"]),
            ])->find();

            if ($specsInfo) {
                $goods->market_price = $specsInfo->market_price;
                $goods->integral = $specsInfo->integral;
                $goods->total_stock = $specsInfo->stock;
            }
        }

        $this->success('success', $goods);
    }

    public function getSpecs($id = 0)
    {
        $specs = $this->request->param('specs', '');
        $specsInfo = MallGoodsSpecs::where([
            'goods_id' => $id,
            'specs_list' => json_encode(["$specs"]),
        ])->find();

        $this->success('success', $specsInfo);
    }
}
