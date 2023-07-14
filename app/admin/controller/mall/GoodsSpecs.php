<?php
/**
 * copyright@Administrator
 * 2023/6/27 0027 17:39
 * email:arron1118@icloud.com
 */

namespace app\admin\controller\mall;

use app\admin\traits\Curd;
use app\common\model\MallGoodsSpecs;
use EasyAdmin\annotation\ControllerAnnotation;

/**
 * GoodsSpecs
 * @package app\admin\controller\mall
 * @ControllerAnnotation(title="商品SKU管理")
 */
class GoodsSpecs extends \app\common\controller\AdminController
{

    use Curd;

    protected function initialize()
    {
        parent::initialize();

        $this->model = new MallGoodsSpecs();
    }

}
