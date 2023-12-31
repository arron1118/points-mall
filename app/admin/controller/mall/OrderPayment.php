<?php
/**
 * copyright@Administrator
 * 2023/6/27 0027 17:40
 * email:arron1118@icloud.com
 */

namespace app\admin\controller\mall;

use app\admin\traits\Curd;
use app\common\model\MallOrderPayment;
use EasyAdmin\annotation\ControllerAnnotation;

/**
 * OrderPayment
 * @package app\admin\controller\mall
 * @ControllerAnnotation(title="订单支付管理")
 */
class OrderPayment extends \app\common\controller\AdminController
{

    use Curd;

    protected function initialize()
    {
        parent::initialize();

        $this->model = new MallOrderPayment();
    }


}
