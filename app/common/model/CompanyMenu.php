<?php
/**
 * copyright@Administrator
 * 2023/7/4 0004 16:59
 * email:arron1118@icloud.com
 */

namespace app\common\model;

use app\common\constants\MenuConstant;

class CompanyMenu extends TimeModel
{

    public function getPidMenuList()
    {
        $list = $this->field('id,pid,title')
            ->where([
                ['pid', '<>', MenuConstant::HOME_PID],
                ['status', '=', 1],
            ])
            ->select()
            ->toArray();
        $pidMenuList = $this->buildPidMenu(0, $list);
        return array_merge([[
            'id' => 0,
            'pid' => 0,
            'title' => '顶级菜单',
        ]], $pidMenuList);
    }

    protected function buildPidMenu($pid, $list, $level = 0)
    {
        $newList = [];
        foreach ($list as $vo) {
            if ($vo['pid'] === $pid) {
                $level++;
                foreach ($newList as $v) {
                    if ($vo['pid'] === $v['pid'] && isset($v['level'])) {
                        $level = $v['level'];
                        break;
                    }
                }
                $vo['level'] = $level;
                if ($level > 1) {
                    $repeatString = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
                    $markString = str_repeat($repeatString, $level - 1);
                    $vo['title'] = $markString . $vo['title'];
                }
                $newList[] = $vo;
                $childList = $this->buildPidMenu($vo['id'], $list, $level);
                !empty($childList) && $newList = array_merge($newList, $childList);
            }

        }
        return $newList;
    }

}
