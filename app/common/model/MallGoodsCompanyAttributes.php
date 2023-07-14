<?php
/**
 * copyright@Administrator
 * 2023/6/30 0030 10:29
 * email:arron1118@icloud.com
 */

namespace app\common\model;

class MallGoodsCompanyAttributes extends TimeModel
{

    public function company()
    {
        return $this->belongsTo(CompanyUsers::class, 'company_id', 'id');
    }

}
