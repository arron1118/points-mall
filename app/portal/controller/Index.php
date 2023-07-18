<?php
declare (strict_types = 1);

namespace app\portal\controller;

use app\common\controller\PortalController;

class Index extends PortalController
{
    public function index()
    {
        return '您好！这是一个[portal]示例应用';
    }
}
