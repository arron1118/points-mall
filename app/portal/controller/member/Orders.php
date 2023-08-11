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
            $page = $this->request->param('page/d', 1);
            $limit = $this->request->param('limit/d', 50);
            $type = $this->request->param('type/s', 'all');
            $where = [
                'user_id' => $this->userInfo->id,
            ];

            switch ($type) {
                case 'waitPay':
                    $where['status'] = 0;
                    break;

                case 'waitSend':
                    $where['status'] = 1;
                    $where['express_status'] = 0;
                    break;

                case 'waitConfirm':
                    $where['status'] = 1;
                    $where['express_status'] = 1;
                    break;

                case 'waitRate':
                    $where['status'] = 2;
                    $where['express_status'] = 2;
                    $where['evaluate_status'] = 0;
                    break;

                default:
                    break;
            }

            $total = $this->model->where($where)->count();
            $list = $this->model->with(['orderItems' => function ($query) {
                        return $query->with(['goods' => function ($q) {
                            return $q->field('id, title, attribute_list');
                        }]);
                    },
                    'company' => function ($query) {
                        return $query->field('id, username');
                }])
                ->where($where)
                ->order('id desc')
                ->limit(($page - 1) * $limit, $limit)
                ->select()
                ->append(['status_text', 'express_status_text', 'evaluate_status_text']);

            $this->success('success', [
                'list' => $list,
                'total' => $total,
            ]);
        }

        $this->error('参数错误');
    }
}
