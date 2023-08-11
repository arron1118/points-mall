<?php
/**
 * copyright@Administrator
 * 2023/6/27 0027 17:20
 * email:arron1118@icloud.com
 */

namespace app\common\model;

class MallOrders extends TimeModel
{

    public function getStatusTextAttr($value, $data)
    {
        return $this->getStatusList()[$data['status']];
    }

    public function getExpressStatusTextAttr($value, $data)
    {
        return $this->getExpressStatusList()[$data['express_status']];
    }

    public function getEvaluateStatusTextAttr($value, $data)
    {
        return $this->getEvaluateStatusList()[$data['evaluate_status']];
    }

    public function getStatusList()
    {
        return [
            0 => '未付款',
            1 => '已付款',
            2 => '交易完成',
            9 => '交易关闭',
        ];
    }

    public function getExpressStatusList()
    {
        return [
            0 => '待发货',
            1 => '已发货',
            2 => '已收货',
            9 => '物流异常',
        ];
    }

    public function getEvaluateStatusList()
    {
        return [
            0 => '待评价',
            1 => '已评价',
        ];
    }

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
