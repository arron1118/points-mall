<?php
/**
 * copyright@Administrator
 * 2023/7/18 0018 17:45
 * email:arron1118@icloud.com
 */

namespace app\common\controller;

class PortalController extends \app\BaseController
{

    /**
     * 模板布局
     * @var string
     */
    protected $layout = 'layout/default';


    protected function initialize()
    {
        parent::initialize();
        $this->layout && $this->app->view->engine()->layout($this->layout);
    }

}
