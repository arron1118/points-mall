<?php
/**
 * copyright@Administrator
 * 2023/6/27 0027 17:16
 * email:arron1118@icloud.com
 */

namespace app\common\model;

class MallGoodsHistory extends TimeModel
{

    public function company()
    {
        return $this->belongsTo(CompanyUsers::class, 'company_id', 'id');
    }

    public function users()
    {
        return $this->belongsTo(MemberUsers::class, 'user_id', 'id');
    }

    public function goods()
    {
        return $this->belongsTo(MallGoods::class, 'goods_id', 'id');
    }

}
