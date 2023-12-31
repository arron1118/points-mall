<?php
/**
 * copyright@Administrator
 * 2023/6/27 0027 17:19
 * email:arron1118@icloud.com
 */

namespace app\common\model;

class MallOrderItems extends TimeModel
{

    protected $json = [
        'specs_name',
    ];

    protected $jsonAssoc = true;

    public function goods()
    {
        return $this->belongsTo(MallGoods::class, 'goods_id', 'id');
    }

    public function goodsSpecs()
    {
        return $this->belongsTo(MallGoodsSpecs::class, 'goods_specs_id', 'id');
    }

    public function orders()
    {
        return $this->belongsTo(MallOrders::class, 'order_no', 'order_no');
    }

}
