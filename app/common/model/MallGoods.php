<?php

namespace app\common\model;

use think\Model;

class MallGoods extends TimeModel
{

    protected $json = [
        'property',
        'attribute_list',
    ];

    protected $jsonAssoc = true;

    public function getStatusTextAttr($value, $data)
    {
        return $this->getStatusList()[$data['status']];
    }

    public function getStatusList()
    {
        return ['下架', '上架'];
    }

    public function category()
    {
        return $this->belongsTo(MallGoodsCategory::class, 'category_id', 'id');
    }

    public function company()
    {
        return $this->belongsTo(CompanyUsers::class, 'company_id', 'id');
    }

    public function brand()
    {
        return $this->belongsTo(MallBrands::class, 'brand_id', 'id');
    }

    public function companyAttributes()
    {
        return $this->hasMany(MallGoodsCompanyAttributes::class, 'goods_id', 'id');
    }

    public function goodsSpecs()
    {
        return $this->hasMany(MallGoodsSpecs::class, 'goods_id', 'id');
    }

    public function goodsHistory()
    {
        return $this->hasMany(MallGoodsHistory::class, 'goods_id', 'id');
    }

}
