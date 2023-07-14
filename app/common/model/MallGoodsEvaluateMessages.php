<?php
/**
 * copyright@Administrator
 * 2023/6/27 0027 17:14
 * email:arron1118@icloud.com
 */

namespace app\common\model;

class MallGoodsEvaluateMessages extends TimeModel
{

    public function users()
    {
        return $this->belongsTo(MemberUsers::class, 'user_id', 'id');
    }

    public function evaluates()
    {
        return $this->belongsTo(MallGoodsEvaluates::class, 'evaluate_id', 'id');
    }

}
