<?php
/**
 * copyright@Administrator
 * 2023/6/27 0027 17:17
 * email:arron1118@icloud.com
 */

namespace app\common\model;

class MallGoodsSkuAttributeValues extends TimeModel
{

    public function attributeKey()
    {
        return $this->belongsTo(MallGoodsSkuAttributeKeys::class, 'sku_attribute_id', 'id');
    }

    public function company_attributes()
    {
        return $this->hasMany(MallGoodsCompanyAttributes::class, 'sku_attribute_value_id', 'id');
    }

}
