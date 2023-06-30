<?php
/**
 * copyright@Administrator
 * 2023/6/27 0027 17:39
 * email:arron1118@icloud.com
 */

namespace app\admin\controller\mall;

use app\admin\traits\Curd;
use app\common\model\MallLottery;

class Lottery extends \app\common\controller\AdminController
{

    use Curd;

    protected function initialize()
    {
        parent::initialize();

        $this->model = new MallLottery();
    }

}
