<?php
/**
 * copyright@Administrator
 * 2023/6/27 0027 17:22
 * email:arron1118@icloud.com
 */

namespace app\common\model;

class MemberUsers extends TimeModel
{

    protected $foreignKey = 'user_id';

    protected $localKey = 'id';

    public function address()
    {
        return $this->hasMany(MemberAddress::class, $this->foreignKey, $this->localKey);
    }

    public function orders()
    {
        return $this->hasMany(MallOrders::class, $this->foreignKey, $this->localKey);
    }

    public function order_payment()
    {
        return $this->hasMany(MallOrderPayment::class, $this->foreignKey, $this->localKey);
    }

    public function signin_logs()
    {
        return $this->hasMany(MemberSigninLogs::class, $this->foreignKey, $this->localKey);
    }

    public function lottery_logs()
    {
        return $this->hasMany(MemberLotteryLogs::class, $this->foreignKey, $this->localKey);
    }

    public function lottery_prizes()
    {
        return $this->hasMany(MemberLotteryPrizes::class, $this->foreignKey, $this->localKey);
    }

    public function lottery_receive()
    {
        return $this->hasMany(MemberLotteryReceive::class, $this->foreignKey, $this->localKey);
    }

    public function integral_logs()
    {
        return $this->hasMany(MemberIntegralLogs::class, $this->foreignKey, $this->localKey);
    }

    public function evaluate_messages()
    {
        return $this->hasMany(MallGoodsEvaluateMessages::class, $this->foreignKey, $this->localKey);
    }

    public function evaluates()
    {
        return $this->hasMany(MallGoodsEvaluates::class, $this->foreignKey, $this->localKey);
    }

    public function goods_history()
    {
        return $this->hasMany(MallGoodsHistory::class, $this->foreignKey, $this->localKey);
    }

}
