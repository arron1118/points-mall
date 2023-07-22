<?php
declare (strict_types = 1);

namespace app\portal\controller;

use app\common\controller\PortalController;
use app\common\model\MallGoods;

class Index extends PortalController
{
    public function index()
    {
        $page = $this->request->param('page', 15);
        $limit = $this->request->param('limit', 1);
        $goods = MallGoods::where('status', 1)
            ->order('id desc, sort desc')
            ->limit(($limit - 1) * $page, $page)
            ->select();

        $this->view->assign([
            'goods' => $goods,
        ]);
        return $this->view->fetch();
    }

    public function login()
    {
        $this->view->engine()->layout(false);

        return $this->view->fetch();
    }

    public function register()
    {
        return $this->view->fetch();
    }

}
