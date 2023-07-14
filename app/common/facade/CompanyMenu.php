<?php

/**
 * copyright@Administrator
 * 2023/7/10 0010 16:23
 * email:arron1118@icloud.com
 */

namespace app\common\facade;

use think\Facade;

class CompanyMenu extends Facade
{

    protected static function getFacadeClass()
    {
        return 'app\common\service\CompanyMenuService';
    }

}
