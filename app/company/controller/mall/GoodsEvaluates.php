<?php

namespace app\company\controller\mall;

use app\admin\traits\Curd;
use app\common\model\MallGoodsEvaluates;
use EasyAdmin\annotation\ControllerAnnotation;

/**
 * GoodsEvaluates
 * @package app\company\controller\mall
 * @ControllerAnnotation(title="商品评价管理")
 */
class GoodsEvaluates extends \app\common\controller\CompanyController
{

    use Curd;

    protected function initialize()
    {
        parent::initialize();

        $this->model = new MallGoodsEvaluates();
    }

}
