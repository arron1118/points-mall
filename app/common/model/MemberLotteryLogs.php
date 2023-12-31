<?php
/**
 * copyright@Administrator
 * 2023/6/27 0027 17:21
 * email:arron1118@icloud.com
 */

namespace app\common\model;

class MemberLotteryLogs extends TimeModel
{

    protected $json = [
        'lottery_detail',
    ];

    public function users()
    {
        return $this->belongsTo(MemberUsers::class, 'user_id', 'id');
    }

    public function lottery()
    {
        return $this->belongsTo(MallLottery::class, 'lottery_id', 'id');
    }

    public function lotteryPrizes()
    {
        return $this->hasOne(MemberLotteryPrizes::class, 'lottery_log_id', 'id');
    }

}
