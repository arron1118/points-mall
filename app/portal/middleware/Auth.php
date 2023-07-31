<?php
/**
 * copyright@Administrator
 * 2023/7/26 0026 9:16
 * email:arron1118@icloud.com
 */

namespace app\portal\middleware;

use app\common\model\MemberUsers;

class Auth
{
    private $model;

    private $noNeedLogin = ['login'];

    private $token;

    public function handle($request, \Closure $next)
    {
        $this->model = new MemberUsers();
        $this->token = $request->cookie('points_mall_portal_token');
        if (!$this->checkToken()) {
            if ($request->isAjax()) {
                return json(['url' => (string) url('/login', [], true, true), 'code' => 5003]);
            }

            return redirect((string) url('/login'));
        }

        return $next($request);
    }

    protected function checkToken()
    {
        if ($this->token) {
            $userInfo = $this->model::getByToken($this->token);

            return !(!$userInfo || !$userInfo->status || $userInfo->token_expire_time < time());
        }

        return false;
    }

}
