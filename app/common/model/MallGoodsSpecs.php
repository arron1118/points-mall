<?php
/**
 * copyright@Administrator
 * 2023/6/27 0027 17:18
 * email:arron1118@icloud.com
 */

namespace app\common\model;

class MallGoodsSpecs extends TimeModel
{

    protected $json = [
        'specs_list'
    ];

    protected $jsonAssoc = true;

    public function goods()
    {
        return $this->belongsTo(MallGoods::class, 'goods_id', 'id');
    }

    public function order_items()
    {
        return $this->belongsTo(MallOrderItems::class, 'goods_specs_id', 'id');
    }

}
