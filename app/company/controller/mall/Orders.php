<?php

namespace app\company\controller\mall;

use app\admin\traits\Curd;
use app\common\model\MallOrders;
use EasyAdmin\annotation\ControllerAnnotation;

/**
 * Orders
 * @package app\company\controller\mall
 * @ControllerAnnotation(title="订单管理")
 */
class Orders extends \app\common\controller\CompanyController
{

    use Curd;

    protected function initialize()
    {
        parent::initialize();

        $this->model = new MallOrders();
    }

    /**
     * @NodeAnotation(title="列表")
     */
    public function index()
    {
        if ($this->request->isAjax()) {
            if (input('selectFields')) {
                return $this->selectList();
            }
            list($page, $limit, $where) = $this->buildTableParames();
            $count = $this->model
                ->with(['user'])
                ->where($where)
                ->count();
            $list = $this->model
                ->with([
                    'user' => function ($query) {
                        return $query->field('id, username, realname');
                    }
                ])
                ->where($where)
                ->page($page, $limit)
                ->order($this->sort)
                ->select();
            $data = [
                'code'  => 0,
                'msg'   => '',
                'count' => $count,
                'data'  => $list,
            ];
            return json($data);
        }
        return $this->fetch();
    }

}
