<?php

// +----------------------------------------------------------------------
// | EasyAdmin
// +----------------------------------------------------------------------
// | PHP交流群: 763822524
// +----------------------------------------------------------------------
// | 开源协议  https://mit-license.org
// +----------------------------------------------------------------------
// | github开源项目：https://github.com/zhongshaofa/EasyAdmin
// +----------------------------------------------------------------------

namespace app\company\controller;


use app\common\controller\CompanyController;
use app\common\model\CompanySigninLogs;
use app\common\model\CompanyUsers;
use think\captcha\facade\Captcha;
use think\facade\Cookie;
use think\facade\Env;

/**
 * Class Login
 * @package app\company\controller
 */
class Login extends CompanyController
{

    /**
     * 初始化方法
     */
    public function initialize()
    {
        parent::initialize();
        $action = $this->request->action();
        if ($this->userInfo && !in_array($action, ['out'])) {
            $this->success('已登录，无需再次登录', [], __url("@company"));
        }
    }

    /**
     * 用户登录
     * @return string
     * @throws \Exception
     */
    public function index()
    {
        $captcha = Env::get('easyadmin.captcha', 1);
        if ($this->request->isPost()) {
            $post = $this->request->post();
            $rule = [
                'username|用户名'      => 'require',
                'password|密码'       => 'require',
                'keep_login|是否保持登录' => 'require',
            ];
            $captcha == 1 && $rule['captcha|验证码'] = 'require|captcha';
            $this->validate($post, $rule);
            $admin = CompanyUsers::where(['username' => $post['username']])->find();
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
            $companySigninLogs = new CompanySigninLogs();
            $companySigninLogs->company_id = $admin->id;
            $companySigninLogs->ip = $this->request->ip();
            $companySigninLogs->platform = $this->agent->platform();
            $companySigninLogs->platform_version = $this->agent->version($this->agent->platform());
            $companySigninLogs->browser = $this->agent->browser();
            $companySigninLogs->browser_version = $this->agent->version($this->agent->browser());
            $companySigninLogs->device = $this->agent->device();
            $companySigninLogs->device_type = $this->agent->deviceType();
            $companySigninLogs->save();

            Cookie::set('points_mall_company_token', $token, $this->token_expire_time);

            $this->success('登录成功');
        }
        $this->assign('captcha', $captcha);
        $this->assign('demo', $this->isDemo);
        return $this->fetch();
    }

    /**
     * 用户退出
     * @return mixed
     */
    public function out()
    {
        Cookie::delete('points_mall_company_token');
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
        return Captcha::create();
    }
}
