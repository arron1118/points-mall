<?php
/**
 * copyright@Administrator
 * 2023/6/27 0027 17:34
 * email:arron1118@icloud.com
 */

namespace app\admin\controller\mall;

use app\admin\traits\Curd;
use app\common\model\MallBrands;
use EasyAdmin\annotation\ControllerAnnotation;

/**
 * Brands
 * @package app\admin\controller\mall
 * @ControllerAnnotation(title="品牌管理")
 */
class Brands extends \app\common\controller\AdminController
{

    use Curd;

    protected function initialize()
    {
        parent::initialize();

        $this->model = new MallBrands();
    }
}
