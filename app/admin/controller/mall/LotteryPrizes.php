<?php
/**
 * copyright@Administrator
 * 2023/6/27 0027 17:40
 * email:arron1118@icloud.com
 */

namespace app\admin\controller\mall;

use app\admin\traits\Curd;
use app\common\model\MallLotteryPrizes;
use EasyAdmin\annotation\ControllerAnnotation;

/**
 * LotteryPrizes
 * @package app\admin\controller\mall
 * @ControllerAnnotation(title="幸运抽奖奖品管理")
 */
class LotteryPrizes extends \app\common\controller\AdminController
{

    use Curd;

    protected function initialize()
    {
        parent::initialize();

        $this->model = new MallLotteryPrizes();
    }

}
