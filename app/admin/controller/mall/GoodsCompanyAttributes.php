<?php
/**
 * copyright@Administrator
 * 2023/6/30 0030 10:31
 * email:arron1118@icloud.com
 */

namespace app\admin\controller\mall;

use app\admin\traits\Curd;
use app\common\model\MallGoodsCompanyAttributes;

class GoodsCompanyAttributes extends \app\common\controller\AdminController
{

    use Curd;

    protected function initialize()
    {
        parent::initialize();

        $this->model = new MallGoodsCompanyAttributes();
    }

}
