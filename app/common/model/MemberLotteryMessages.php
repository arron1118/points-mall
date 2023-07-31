<?php
/**
 * copyright@Administrator
 * 2023/7/31 0031 16:21
 * email:arron1118@icloud.com
 */

namespace app\common\model;

class MemberLotteryMessages extends TimeModel
{

    public function users()
    {
        return $this->belongsTo(MemberUsers::class, 'user_id', 'id');
    }

    public function lottery()
    {
        return $this->belongsTo(MallLottery::class, 'lottery_id', 'id');
    }

}
