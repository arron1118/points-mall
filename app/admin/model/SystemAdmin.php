<?php

// +----------------------------------------------------------------------
// | EasyAdmin
// +----------------------------------------------------------------------
// | PHP交流群: 763822524
// +----------------------------------------------------------------------
// | 开源协议  https://mit-license.org
// +----------------------------------------------------------------------
// | github开源项目：https://github.com/zhongshaofa/EasyAdmin
// +----------------------------------------------------------------------

namespace app\admin\model;


use app\common\model\TimeModel;

class SystemAdmin extends TimeModel
{

    protected $deleteTime = 'delete_time';

    public function getAuthList()
    {
        return (new SystemAuth())
            ->where('status', 1)
            ->column('title', 'id');
    }

    public function uploadfile()
    {
        return $this->hasMany(SystemUploadfile::class, 'admin_id', 'id');
    }

}
