<?php
/**
 * copyright@Administrator
 * 2023/6/27 0027 17:20
 * email:arron1118@icloud.com
 */

namespace app\common\model;

class MallOrders extends TimeModel
{

    public function users()
    {
        return $this->belongsTo(MemberUsers::class, 'user_id', 'id');
    }

    public function company()
    {
        return $this->belongsTo(CompanyUsers::class, 'company_id', 'id');
    }

    public function orderItems()
    {
        return $this->hasMany(MallOrderItems::class, 'order_no', 'order_no');
    }

    public function orderPayment()
    {
        return $this->hasMany(MallOrderPayment::class, 'order_no', 'order_no');
    }

}
