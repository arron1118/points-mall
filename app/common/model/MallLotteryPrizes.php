<?php
/**
 * copyright@Administrator
 * 2023/6/27 0027 17:19
 * email:arron1118@icloud.com
 */

namespace app\common\model;

class MallLotteryPrizes extends TimeModel
{

    public function lottery()
    {
        return $this->belongsTo(MallLottery::class, 'lottery_id', 'id');
    }

    public function goods()
    {
        return $this->belongsTo(MallGoods::class, 'goods_id', 'id');
    }

    public function member_lottery_logs()
    {
        return $this->belongsToMany(MemberLotteryLogs::class, 'prize_id', 'id');
    }

    public function getTypeList()
    {
        return [
            1 => '其他',
            2 => '积分',
            3 => '金额',
            4 => '商品'
        ];
    }

}
