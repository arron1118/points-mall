<?php
/**
 * copyright@Administrator
 * 2023/7/24 0024 14:24
 * email:arron1118@icloud.com
 */

namespace app\portal\controller;

class AnalysisRegion extends \app\common\controller\PortalController
{

    protected function initialize()
    {
        parent::initialize();

        $this->model = new \app\common\model\AnalysisRegion();
    }

    public function getRegion($pid = 0)
    {
        $region = $this->model::field('id, region_name')->where('parent_id', $pid)->select();

        $this->success('success', $region);
    }

}
