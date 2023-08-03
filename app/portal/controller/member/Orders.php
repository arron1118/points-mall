<?php
/**
 * copyright@Administrator
 * 2023/7/19 0019 11:33
 * email:arron1118@icloud.com
 */

namespace app\portal\controller\member;

use app\common\model\MallOrders;
use app\portal\middleware\Auth;

class Orders extends \app\common\controller\PortalController
{

    protected $middleware = [Auth::class];

    protected function initialize()
    {
        parent::initialize();

        $this->model = new MallOrders();
    }

    public function index()
    {
        return $this->view->fetch();
    }

    public function getOrderList()
    {
        if ($this->request->isGet()) {
            $list = $this->model->with(['orderItems'])
                ->where([
                'user_id' => $this->userInfo->id,
            ])->order('id desc')
                ->select()
                ->append(['status_text']);

            $this->success('success', $list);
        }

        $this->error('参数错误');
    }
}
