<?php
/**
 * copyright@Administrator
 * 2023/6/27 0027 17:22
 * email:arron1118@icloud.com
 */

namespace app\common\model;

class MemberSigninLogs extends TimeModel
{

    public function users()
    {
        return $this->belongsTo(MemberUsers::class, 'user_id', 'id');
    }

}
