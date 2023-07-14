<?php

namespace app\common\service;

use app\common\constants\CompanyMenuConstant;
use think\facade\Db;

class CompanyMenuService
{

    /**
     * 获取首页信息
     * @return array|\think\Model|null
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function getHomeInfo()
    {
        $data = Db::name('company_menu')
            ->field('title,icon,href')
            ->where("delete_time is null")
            ->where('pid', CompanyMenuConstant::HOME_PID)
            ->find();
        !empty($data) && $data['href'] = __url($data['href']);
        return $data;
    }

    /**
     * 获取后台菜单树信息
     * @return array
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function getMenuTree()
    {
        return $this->buildMenuChild(0, $this->getMenuData());
    }

    private function buildMenuChild($pid, $menuList)
    {
        $treeList = [];
        foreach ($menuList as &$v) {
            !empty($v['href']) && $v['href'] = __url($v['href']);
            if ($pid === $v['pid']) {
                $node = $v;
                $node['child'] = $this->buildMenuChild($v['id'], $menuList);
                if (!empty($v['href']) || !empty($node['child'])) {
                    $treeList[] = $node;
                }
            }
        }
        return $treeList;
    }

    /**
     * 获取所有菜单数据
     * @return \think\Collection
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    protected function getMenuData()
    {
        return Db::name('company_menu')
            ->field('id,pid,title,icon,href,target')
            ->where("delete_time is null")
            ->where([
                ['status', '=', '1'],
                ['pid', '<>', CompanyMenuConstant::HOME_PID],
            ])
            ->order([
                'sort' => 'desc',
                'id' => 'asc',
            ])
            ->select();
    }

}
