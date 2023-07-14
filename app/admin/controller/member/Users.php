<?php

namespace app\admin\controller\member;

use EasyAdmin\annotation\ControllerAnnotation;

/**
 * copyright@Administrator
 * 2023/6/27 0027 17:45
 * email:arron1118@icloud.com
 */

/**
 * Users
 * @package app\admin\controller\member
 * @ControllerAnnotation(title="用户管理")
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
