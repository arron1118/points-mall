<?php

namespace app\admin\controller\member;

use EasyAdmin\annotation\ControllerAnnotation;

/**
 * copyright@Administrator
 * 2023/6/27 0027 17:45
 * email:arron1118@icloud.com
 */

/**
 * SigninLogs
 * @package app\admin\controller\member
 * @ControllerAnnotation(title="用户登录记录")
 */
class SigninLogs extends \app\common\controller\AdminController
{

    use \app\admin\traits\Curd;

    protected function initialize()
    {
        parent::initialize();

        $this->model = new \app\common\model\MemberSigninLogs();
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
                ->with(['users'])
                ->where($where)
                ->count();
            $list = $this->model
                ->with([
                    'users' => function ($query) {
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
