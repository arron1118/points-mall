<?php
/**
 * copyright@Administrator
 * 2023/7/19 0019 11:52
 * email:arron1118@icloud.com
 */

namespace app\portal\controller\member;

use app\common\model\MemberUsers;
use app\portal\middleware\Auth;

class User extends \app\common\controller\PortalController
{

    protected $middleware = [Auth::class];

    protected function initialize()
    {
        parent::initialize();

        $this->model = new MemberUsers();
    }

    public function index()
    {
        return $this->view->fetch();
    }

    public function password()
    {
        return $this->view->fetch();
    }

    /**
     * 修改密码
     * @return string
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function resetPassword()
    {
        if (!$this->userInfo) {
            $this->error('用户信息不存在');
        }

        if ($this->request->isPost()) {
            $post = $this->request->post();
            $rule = [
                'password|登录密码'       => 'require',
                'password_confirm|确认密码' => 'require',
            ];
            $this->validate($post, $rule);
            if ($post['password'] !== $post['password_confirm']) {
                $this->error('两次密码输入不一致');
            }

            try {
                $save = $this->userInfo->save([
                    'password' => password($post['password']),
                ]);
            } catch (\Exception $e) {
                $this->error('修改失败');
            }
            if ($save) {
                $this->success('修改成功');
            } else {
                $this->error('修改失败');
            }
        }
    }

}
