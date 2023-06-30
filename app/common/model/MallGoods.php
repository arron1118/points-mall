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

    public function getSkuAttributes()
    {
        return $this->skuAttributes;
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

    public static function onAfterWrite($goods)
    {
    }

}
