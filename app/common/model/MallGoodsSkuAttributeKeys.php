<?php
/**
 * copyright@Administrator
 * 2023/6/27 0027 17:16
 * email:arron1118@icloud.com
 */

namespace app\common\model;

class MallGoodsSkuAttributeKeys extends TimeModel
{

    public function category()
    {
        return $this->belongsTo(MallGoodsCategory::class, 'category_id', 'id');
    }

    public function attributeValues()
    {
        return $this->hasMany(MallGoodsSkuAttributeValues::class, 'sku_attribute_id', 'id');
    }

    public function getAttributeKeysList()
    {
        return $this->order('sort desc')->select()->toArray();
    }
}
