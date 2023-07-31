<?php
/**
 * copyright@Administrator
 * 2023/7/18 0018 17:45
 * email:arron1118@icloud.com
 */

namespace app\common\controller;

use app\admin\service\ConfigService;
use app\common\model\MemberUsers;
use app\portal\traits\JumpTrait;
use think\facade\Cookie;
use think\View;

class PortalController extends \app\BaseController
{

    use JumpTrait;

    /**
     * 模板布局
     * @var string
     */
    protected $layout = 'layout/default';

    /**
     * @var View
     */
    protected $view;

    /**
     * @var $model
     */
    protected $model;

    protected $userInfo;

    protected $returnData = [
        'code' => 0,
        'msg' => '操作成功',
        'data' => [],
    ];


    protected function initialize()
    {
        parent::initialize();
        $this->view = $this->app->view;
        $this->layout && $this->view->engine()->layout($this->layout);

        $this->checkAuth();
        $this->viewInit();
    }


    /**
     * 初始化视图参数
     */
    private function viewInit()
    {
        $thisModule = app('http')->getName();
        $thisController = app()->request->controller();
        $thisAction = $this->request->action();
        $thisControllerArr = explode('.', $thisController);
        $jsPath = null;
        foreach ($thisControllerArr as $vo) {
            empty($jsPath) ? $jsPath = parse_name($vo) : $jsPath .= '/' . parse_name($vo);
        }
        $autoloadJs = file_exists(root_path('public') . "static/{$thisModule}/js/{$jsPath}.js");
        $thisControllerJsPath = "{$thisModule}/js/{$jsPath}.js";
        $adminModuleName = 'company';
        $data = [
            'adminModuleName' => $adminModuleName,
            'thisController' => parse_name($thisController),
            'thisAction' => $thisAction,
            'thisRequest' => parse_name("{$thisModule}/{$thisController}/{$thisAction}"),
            'thisControllerJsPath' => "{$thisControllerJsPath}",
            'autoloadJs' => $autoloadJs,
            'version' => env('app_debug') ? time() : ConfigService::getVersion(),
            'userInfo' => $this->userInfo,
        ];

        $this->view->assign($data);
    }

    /**
     * 检测权限
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    private function checkAuth()
    {
//        $adminConfig = config('portal');
//        $currentController = parse_name(app()->request->controller());
        $userToken = Cookie::get('points_mall_portal_token');
        $userToken && $this->userInfo = MemberUsers::where('token', $userToken)->find();

        // 验证登录
//        if (!in_array($currentController, $adminConfig['no_login_controller'])) {
//            empty($this->userInfo) && $this->error('请先登录后台', [], __url('/login'));
//
//            // 判断是否登录过期
//            if (time() > $this->userInfo->token_expire_time) {
//                Cookie::delete('points_mall_company_token');
//                $this->error('登录已过期，请重新登录', [], __url('/login'));
//            }
//        }
    }
}
