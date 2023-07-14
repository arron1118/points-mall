<?php
/**
 * copyright@Administrator
 * 2023/6/27 0027 17:18
 * email:arron1118@icloud.com
 */

namespace app\common\model;

class MallLottery extends TimeModel
{

    protected $json = [
        'prize_list',
    ];

    public function getStartTimeTextAttr($value)
    {
        return $value ?? date($this->dateFormat, $value);
    }

    public function getEndTimeTextAttr($value)
    {
        return $value && date($this->dateFormat, $value);
    }

    public function company()
    {
        return $this->belongsTo(CompanyUsers::class, 'company_id', 'id');
    }

    public function lotteryPrizes()
    {
        return $this->hasMany(MallLotteryPrizes::class, 'lottery_id', 'id');
    }

    public function memberLotteryLogs()
    {
        return $this->hasMany(MemberLotteryLogs::class, 'lottery_id', 'id');
    }

    public function memberLotteryPrizes()
    {
        return $this->hasMany(MemberLotteryPrizes::class, 'lottery_id', 'id');
    }

}
