define(["jquery", "easy-admin"], function ($, ea) {

    var init = {
        table_elem: '#currentTable',
        table_render_id: 'currentTableRenderId',
        index_url: 'mall.goods_sku_attribute_keys/index',
        add_url: 'mall.goods_sku_attribute_keys/add',
        edit_url: 'mall.goods_sku_attribute_keys/edit',
        delete_url: 'mall.goods_sku_attribute_keys/delete',
        export_url: 'mall.goods_sku_attribute_keys/export',
        modify_url: 'mall.goods_sku_attribute_keys/modify',
    };

    var Controller = {

        index: function () {
            ea.table.render({
                init: init,
                cols: [[
                    {type: "checkbox"},
                    {field: 'id', width: 80, title: 'ID'},
                    {field: 'sku_attribute_name', minWidth: 80, title: '名称'},
                    {field: 'category.category_name', minWidth: 80, title: '商品分类', search: false,},
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
