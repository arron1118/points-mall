<?php
/**
 * copyright@Administrator
 * 2023/7/19 0019 11:52
 * email:arron1118@icloud.com
 */

namespace app\portal\controller\member;

use app\common\model\MemberUsers;

class User extends \app\common\controller\PortalController
{

    protected function initialize()
    {
        parent::initialize();

        $this->model = new MemberUsers();
    }

    public function index()
    {
        return $this->view->fetch();
    }

    public function password()
    {
        return $this->view->fetch();
    }

}
