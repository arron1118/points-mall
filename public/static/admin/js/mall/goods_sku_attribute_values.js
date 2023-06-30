define(["jquery", "easy-admin"], function ($, ea) {

    var init = {
        table_elem: '#currentTable',
        table_render_id: 'currentTableRenderId',
        index_url: 'mall.goods_sku_attribute_values/index',
        add_url: 'mall.goods_sku_attribute_values/add',
        edit_url: 'mall.goods_sku_attribute_values/edit',
        delete_url: 'mall.goods_sku_attribute_values/delete',
        export_url: 'mall.goods_sku_attribute_values/export',
        modify_url: 'mall.goods_sku_attribute_values/modify',
    };

    var Controller = {

        index: function () {
            ea.table.render({
                init: init,
                cols: [[
                    {type: "checkbox"},
                    {field: 'id', width: 80, title: 'ID'},
                    {field: 'sku_attribute_value', minWidth: 80, title: '属性值'},
                    {field: 'attributeKey.sku_attribute_name', minWidth: 80, title: '属性类型', search: false,},
                    {field: 'sort', width: 80, title: '排序', edit: 'text', search: false,},
                    {field: 'create_time', minWidth: 80, title: '创建时间', search: 'range', search: false,},
                    {
                        width: 250,
                        title: '操作',
                        templet: ea.table.tool,
                        operat: [
                            'edit',
                            'delete']
                    }
                ]],
            });

            ea.listen();
        },
        add: function () {
            ea.listen();
        },
        edit: function () {
            ea.listen();
        },
    };
    return Controller;
});
