<?php
/**
 * copyright@Administrator
 * 2023/6/27 0027 17:11
 * email:arron1118@icloud.com
 */

namespace app\common\model;


class CompanyUsers extends TimeModel
{

    protected $foreignKey = 'company_id';

    public function getIsSelfCompanyTextAttr($value, $data)
    {
        return $this->getisSelfCompanyList()[$data['is_self_company']];
    }

    public function getisSelfCompanyList()
    {
        return [0 => '否', 1 => '是'];
    }

    /**
     * 商品
     * @return \think\model\relation\HasMany
     */
    public function goods()
    {
        return $this->hasMany(MallGoods::class, $this->foreignKey, 'id');
    }

    /**
     * 商家商品属性
     * @return \think\model\relation\HasMany
     */
    public function goodsCompanyAttributes()
    {
        return $this->hasMany(MallGoodsCompanyAttributes::class, $this->foreignKey, 'id');
    }

    public function orders()
    {
        return $this->hasMany(MallOrders::class, $this->foreignKey, 'id');
    }

    public function evaluate_reply()
    {
        return $this->hasMany(MallGoodsEvaluateReply::class, $this->foreignKey, 'id');
    }

    public function lottery()
    {
        return $this->hasMany(MallLottery::class, $this->foreignKey, 'id');
    }

    public function signin_logs()
    {
        return $this->hasMany(CompanySigninLogs::class, $this->foreignKey, 'id');
    }

    public function goods_history()
    {
        return $this->hasMany(MallGoodsHistory::class, $this->foreignKey, 'id');
    }

}
