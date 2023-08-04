<?php
/**
 * copyright@Administrator
 * 2023/8/4 0004 10:18
 * email:arron1118@icloud.com
 */

namespace app\portal\controller\mall;

use app\common\controller\PortalController;

class Search extends PortalController
{

    public function index()
    {
        return $this->view->fetch();
    }
}
