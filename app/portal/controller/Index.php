<?php
declare (strict_types = 1);

namespace app\portal\controller;

use app\common\controller\PortalController;
use app\common\model\MemberSigninLogs;
use app\common\model\MallGoods;
use app\common\model\MemberUsers;
use think\captcha\facade\Captcha;
use think\facade\Cookie;
use think\facade\Env;

class Index extends PortalController
{
    public function index()
    {
        return $this->view->fetch();
    }

    public function login()
    {
        $this->view->engine()->layout(false);

        return $this->view->fetch();
    }

    /**
     * 用户登录
     * @return string
     * @throws \Exception
     */
    public function doLogin()
    {
        if ($this->request->isPost()) {
            $post = $this->request->post();
            $rule = [
                'phone|手机号'      => 'require',
                'password|密码'       => 'require',
                'captcha|验证码' => 'require|captcha',
            ];
            $this->validate($post, $rule);
            $admin = MemberUsers::where(['phone' => $post['phone']])->find();
            if (empty($admin)) {
                $this->error('用户不存在');
            }
            if (password($post['password']) !== $admin->password) {
                $this->error('密码输入有误');
            }
            if ($admin->status === 0) {
                $this->error('账号已被禁用');
            }
            $token = createToken($admin->password);
            $admin->token = $token;
            $admin->token_expire_time = time() + $this->token_expire_time;
            $admin->login_num += 1;
            $admin->save();

            // 登录日志
            $companySigninLogs = new MemberSigninLogs();
            $companySigninLogs->user_id = $admin->id;
            $companySigninLogs->ip = $this->request->ip();
            $companySigninLogs->platform = $this->agent->platform();
            $companySigninLogs->platform_version = $this->agent->version($this->agent->platform());
            $companySigninLogs->browser = $this->agent->browser();
            $companySigninLogs->browser_version = $this->agent->version($this->agent->browser());
            $companySigninLogs->device = $this->agent->device();
            $companySigninLogs->device_type = $this->agent->deviceType();
            $companySigninLogs->save();

            Cookie::set('points_mall_portal_token', $token, $this->token_expire_time);

            $this->success('登录成功');
        }
    }

    public function register()
    {
        return $this->view->fetch();
    }

    public function doRegister()
    {
        if ($this->request->isPost()) {
            $post = $this->request->param();

            if (MemberUsers::where('phone', $post['phone'])->find()) {
                $this->error('手机号已经存在');
            }

            if ($post['password'] !== $post['confirm_password']) {
                $this->error('两次密码输入不一致');
            }

            $post['username'] = generateRandomString();
            $post['password'] = password($post['password']);
            (new MemberUsers)->save($post) ? $this->success('注册成功', '', (string) url('/registerSuccess')) : $this->error('注册失败');
        }
    }

    public function registerSuccess()
    {
        return $this->view->fetch();
    }

    /**
     * 用户退出
     * @return mixed
     */
    public function out()
    {
        Cookie::delete('points_mall_portal_token');
        $this->userInfo->token = null;
        $this->userInfo->token_expire_time = null;
        $this->userInfo->save();
        $this->success('退出登录成功');
    }

    /**
     * 验证码
     * @return \think\Response
     */
    public function captcha()
    {
        return captcha_src();
    }

}
