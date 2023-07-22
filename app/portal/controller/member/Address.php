<?php
/**
 * copyright@Administrator
 * 2023/7/20 0020 9:35
 * email:arron1118@icloud.com
 */

namespace app\portal\controller\member;

use app\common\model\MemberAddress;

class Address extends \app\common\controller\PortalController
{

    public function initialize()
    {
        parent::initialize();

        $this->model = new MemberAddress();
    }

    public function index()
    {
        return $this->view->fetch();
    }

    public function add()
    {
        return $this->view->fetch();
    }

}
