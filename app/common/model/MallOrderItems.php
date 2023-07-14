<?php
/**
 * copyright@Administrator
 * 2023/6/27 0027 17:19
 * email:arron1118@icloud.com
 */

namespace app\common\model;

class MallOrderItems extends TimeModel
{

    public function goods()
    {
        return $this->belongsTo(MallGoods::class, 'goods_id', 'id');
    }

    public function goods_specs()
    {
        return $this->belongsTo(MallGoodsSpecs::class, 'goods_specs_id', 'id');
    }

    public function orders()
    {
        return $this->belongsTo(MallOrders::class, 'order_no', 'order_no');
    }

}
