<?php

namespace app\company\controller\mall;

use app\admin\traits\Curd;
use app\common\model\MallGoodsHistory;
use EasyAdmin\annotation\ControllerAnnotation;

/**
 * GoodsHistory
 * @package app\company\controller\mall
 * @ControllerAnnotation(title="商品浏览记录")
 */
class GoodsHistory extends \app\common\controller\CompanyController
{

    use Curd;

    protected function initialize()
    {
        parent::initialize();

        $this->model = new MallGoodsHistory();
    }

}
