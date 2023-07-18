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

    public function getStartTimeTextAttr($value, $data)
    {
        return $data['start_time'] ? date($this->dateFormat, $data['start_time']) : '';
    }

    public function getEndTimeTextAttr($value, $data)
    {
        return $data['end_time'] ? date($this->dateFormat, $data['end_time']) : '';
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
