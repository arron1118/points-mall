<?php
/**
 * copyright@Administrator
 * 2023/7/12 0012 15:24
 * email:arron1118@icloud.com
 */

namespace app\common\model;

class MemberLotteryReceive extends TimeModel
{

    public function users()
    {
        return $this->belongsTo(MemberUsers::class, 'user_id', 'id');
    }

    public function member_lottery_prizes()
    {
        return $this->belongsTo(MemberLotteryPrizes::class, 'member_lottery_prize_id', 'id');
    }

    public function address()
    {
        return $this->belongsTo(MemberAddress::class, 'address_id', 'id');
    }

}
