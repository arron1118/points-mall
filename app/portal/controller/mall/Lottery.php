<?php
/**
 * copyright@Administrator
 * 2023/7/19 0019 10:37
 * email:arron1118@icloud.com
 */

namespace app\portal\controller\mall;

use app\common\model\MallLottery;

class Lottery extends \app\common\controller\PortalController
{

    protected function initialize()
    {
        parent::initialize();

        $this->model = new MallLottery();
    }

    public function index()
    {
        return $this->view->fetch();
    }
}
