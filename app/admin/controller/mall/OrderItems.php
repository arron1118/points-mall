<?php
/**
 * copyright@Administrator
 * 2023/6/27 0027 17:40
 * email:arron1118@icloud.com
 */

namespace app\admin\controller\mall;

use app\admin\traits\Curd;
use app\common\model\MallOrderItems;
use EasyAdmin\annotation\ControllerAnnotation;

/**
 * OrderItems
 * @package app\admin\controller\mall
 * @ControllerAnnotation(title="订单详细管理")
 */
class OrderItems extends \app\common\controller\AdminController
{

    use Curd;

    protected function initialize()
    {
        parent::initialize();

        $this->model = new MallOrderItems();
    }

}
