<?php
/**
 * copyright@Administrator
 * 2023/6/27 0027 17:20
 * email:arron1118@icloud.com
 */

namespace app\common\model;

class MallOrderPayment extends TimeModel
{

    public function users()
    {
        return $this->belongsTo(MemberUsers::class, 'user_id', 'id');
    }

    public function orders()
    {
        return $this->belongsTo(MallOrders::class, 'order_no', 'order_no');
    }

}
