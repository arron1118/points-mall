<?php

namespace app\admin\controller\member;

/**
 * copyright@Administrator
 * 2023/6/27 0027 17:45
 * email:arron1118@icloud.com
 */
class Users extends \app\common\controller\AdminController
{

    use \app\admin\traits\Curd;

    protected function initialize()
    {
        parent::initialize();

        $this->model = new \app\common\model\MemberUsers();
    }

}
