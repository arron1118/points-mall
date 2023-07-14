<?php
/**
 * copyright@Administrator
 * 2023/6/27 0027 17:15
 * email:arron1118@icloud.com
 */

namespace app\common\model;

class MallGoodsEvaluateReply extends TimeModel
{

    public function company()
    {
        return $this->belongsTo(CompanyUsers::class, 'company_id', 'id');
    }

    public function evaluates()
    {
        return $this->belongsTo(MallGoodsEvaluates::class, 'evaluate_id', 'id');
    }

}
