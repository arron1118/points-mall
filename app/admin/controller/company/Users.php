<?php

namespace app\admin\controller\company;

/**
 * copyright@Administrator
 * 2023/6/27 0027 17:46
 * email:arron1118@icloud.com
 */
class Users extends \app\common\controller\AdminController
{

    use \app\admin\traits\Curd;

    protected function initialize()
    {
        parent::initialize();

        $this->model = new \app\common\model\CompanyUsers();
    }

}
