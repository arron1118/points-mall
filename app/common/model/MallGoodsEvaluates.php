<?php
/**
 * copyright@Administrator
 * 2023/6/27 0027 17:15
 * email:arron1118@icloud.com
 */

namespace app\common\model;

class MallGoodsEvaluates extends TimeModel
{

    public function evaluate_messages()
    {
        return $this->hasMany(MallGoodsEvaluateMessages::class, 'evaluate_id', 'id');
    }

    public function evaluate_reply()
    {
        return $this->hasMany(MallGoodsEvaluateReply::class, 'evaluate_id', 'id');
    }

    public function goods()
    {
        return $this->belongsTo(MallGoods::class, 'goods_id', 'id');
    }

    public function orders()
    {
        return $this->belongsTo(MallOrders::class, 'order_no', 'order_no');
    }

    public function users()
    {
        return $this->belongsTo(MemberUsers::class, 'user_id', 'id');
    }

}
