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

    public function orderPayment()
    {
        return $this->hasMany(MallOrderPayment::class, $this->foreignKey, $this->localKey);
    }

    public function signinLogs()
    {
        return $this->hasMany(MemberSigninLogs::class, $this->foreignKey, $this->localKey);
    }

    public function lotteryLogs()
    {
        return $this->hasMany(MemberLotteryLogs::class, $this->foreignKey, $this->localKey);
    }

    public function lotteryPrizes()
    {
        return $this->hasMany(MemberLotteryPrizes::class, $this->foreignKey, $this->localKey);
    }

    public function lotteryReceive()
    {
        return $this->hasMany(MemberLotteryReceive::class, $this->foreignKey, $this->localKey);
    }

    public function integralLogs()
    {
        return $this->hasMany(MemberIntegralLogs::class, $this->foreignKey, $this->localKey);
    }

    public function evaluateMessages()
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
