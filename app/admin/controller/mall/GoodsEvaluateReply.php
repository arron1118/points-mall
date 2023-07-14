<?php
/**
 * copyright@Administrator
 * 2023/6/27 0027 17:35
 * email:arron1118@icloud.com
 */

namespace app\admin\controller\mall;

use app\admin\traits\Curd;
use app\common\model\MallGoodsEvaluateReply;
use EasyAdmin\annotation\ControllerAnnotation;

/**
 * GoodsEvaluateReply
 * @package app\admin\controller\mall
 * @ControllerAnnotation(title="商品评价回复管理")
 */
class GoodsEvaluateReply extends \app\common\controller\AdminController
{

    use Curd;

    protected function initialize()
    {
        parent::initialize();

        $this->model = new MallGoodsEvaluateReply();
    }

}
