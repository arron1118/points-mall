<?php

namespace app\company\controller\mall;

use app\admin\traits\Curd;
use app\common\model\MallOrderPayment;
use EasyAdmin\annotation\ControllerAnnotation;

/**
 * OrderPayment
 * @package app\company\controller\mall
 * @ControllerAnnotation(title="订单支付管理")
 */
class OrderPayment extends \app\common\controller\CompanyController
{

    use Curd;

    protected function initialize()
    {
        parent::initialize();

        $this->model = new MallOrderPayment();
    }


}
