<?php
/**
 * copyright@Administrator
 * 2023/7/19 0019 14:43
 * email:arron1118@icloud.com
 */

namespace app\portal\controller;

use app\common\model\MemberUsers;

class Login extends \app\common\controller\PortalController
{

    public function initialize()
    {
        $this->layout = false;
        parent::initialize();

        $this->model = new MemberUsers();
    }

    public function index()
    {
        return $this->view->fetch('index/login');
    }

}
