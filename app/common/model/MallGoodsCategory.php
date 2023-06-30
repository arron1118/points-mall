<?php
/**
 * copyright@Administrator
 * 2023/6/27 0027 17:13
 * email:arron1118@icloud.com
 */

namespace app\common\model;

class MallGoodsCategory extends TimeModel
{

    public function getPidMenuList()
    {
        $list        = $this->field('id,pid,category_name')
            ->where([
                ['status', '=', 1],
            ])
            ->select()
            ->toArray();
        $pidMenuList = $this->buildPidMenu(0, $list);
        $pidMenuList = array_merge([[
            'id'    => 0,
            'pid'   => 0,
            'category_name' => '顶级分类',
        ]], $pidMenuList);
        return $pidMenuList;
    }

    protected function buildPidMenu($pid, $list, $level = 0)
    {
        $newList = [];
        foreach ($list as $vo) {
            if ($vo['pid'] == $pid) {
                $level++;
                foreach ($newList as $v) {
                    if ($vo['pid'] == $v['pid'] && isset($v['level'])) {
                        $level = $v['level'];
                        break;
                    }
                }
                $vo['level'] = $level;
                if ($level > 1) {
                    $repeatString = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
                    $markString   = str_repeat($repeatString, $level - 1);
                    $vo['category_name']  = $markString . $vo['category_name'];
                }
                $newList[] = $vo;
                $childList = $this->buildPidMenu($vo['id'], $list, $level);
                !empty($childList) && $newList = array_merge($newList, $childList);
            }

        }
        return $newList;
    }

}
