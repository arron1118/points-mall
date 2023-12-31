<?php
/**
 * copyright@Administrator
 * 2023/6/27 0027 17:41
 * email:arron1118@icloud.com
 */

namespace app\admin\controller\mall;

use app\admin\traits\Curd;
use app\common\model\MallOrders;
use EasyAdmin\annotation\ControllerAnnotation;

/**
 * Orders
 * @package app\admin\controller\mall
 * @ControllerAnnotation(title="订单管理")
 */
class Orders extends \app\common\controller\AdminController
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
            [$page, $limit, $where] = $this->buildTableParames();
            $count = $this->model
                ->with(['users'])
                ->where($where)
                ->count();
            $list = $this->model
                ->with([
                    'users' => function ($query) {
                        return $query->field('id, username, realname');
                    },
                    'orderItems' => function ($query) {
                        return $query->field('order_no, img, title, specs_name, quantity');
                    }
                ])
                ->where($where)
                ->page($page, $limit)
                ->order($this->sort)
                ->select()
                ->append(['status_text']);
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
