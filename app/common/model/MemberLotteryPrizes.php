<?php
/**
 * copyright@Administrator
 * 2023/7/12 0012 15:09
 * email:arron1118@icloud.com
 */

namespace app\common\model;

class MemberLotteryPrizes extends TimeModel
{

    protected $json = [
        'lottery_detail',
        'prize_detail',
    ];

    public function lottery()
    {
        return $this->belongsTo(MallLottery::class, 'lottery_id', 'id');
    }

    public function users()
    {
        return $this->belongsTo(MemberUsers::class, 'user_id', 'id');
    }

    public function lottery_prizes()
    {
        return $this->belongsTo(MallLotteryPrizes::class, 'prize_id', 'id');
    }

    public function member_lottery_receive()
    {
        return $this->hasOne(MemberLotteryReceive::class, 'member_lottery_prize_id', 'id');
    }

}
