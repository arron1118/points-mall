<?php
/**
 * copyright@Administrator
 * 2023/7/20 0020 16:46
 * email:arron1118@icloud.com
 */

namespace app\portal\controller;

class Error extends \app\common\controller\PortalController
{

    public function index($msg = '出错啦~~~')
    {
        return $this->view->fetch('public/error', [
            'msg' => $msg,
        ]);
    }
}
