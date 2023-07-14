<?php

namespace app\admin\controller\company;

use EasyAdmin\annotation\ControllerAnnotation;

/**
 * copyright@Administrator
 * 2023/6/27 0027 17:46
 * email:arron1118@icloud.com
 */

/**
 * SigninLogs
 * @package app\admin\controller\company
 * @ControllerAnnotation(title="商家登录记录")
 */
class SigninLogs extends \app\common\controller\AdminController
{
    use \app\admin\traits\Curd;

    protected function initialize()
    {
        parent::initialize();

        $this->model = new \app\common\model\CompanySigninLogs();
    }

}
