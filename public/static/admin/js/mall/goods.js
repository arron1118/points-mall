define(["jquery", "easy-admin"], function ($, ea) {

    let form = layui.form;

    var init = {
        table_elem: '#currentTable',
        table_render_id: 'currentTableRenderId',
        index_url: 'mall.goods/index',
        add_url: 'mall.goods/add',
        edit_url: 'mall.goods/edit',
        delete_url: 'mall.goods/delete',
        export_url: 'mall.goods/export',
        modify_url: 'mall.goods/modify',
        stock_url: 'mall.goods/stock',
    };

    var Controller = {

        index: function () {
            ea.table.render({
                init: init,
                toolbar: ['refresh', 'delete', 'export'],
                cols: [[
                    {type: "checkbox"},
                    {field: 'id', width: 80, title: 'ID'},
                    {field: 'logo', minWidth: 80, title: '图片', search: false, templet: ea.table.image},
                    {field: 'title', minWidth: 100, title: '商品名称'},
                    {field: 'category.category_name', minWidth: 80, title: '分类', selectList: {0: '下架', 1: '上架'}},
                    {field: 'market_price', width: 100, title: '市场价', templet: ea.table.price},
                    {field: 'discount_price', width: 100, title: '折扣价', templet: ea.table.price},
                    {field: 'integral', width: 100, title: '积分'},
                    {field: 'total_stock', width: 100, title: '库存统计'},
                    {field: 'sales', width: 80, title: '销量', search: false},
                    {field: 'view_count', width: 80, title: '浏览量', search: false},
                    {field: 'company.username', width: 80, title: '商家', search: false},
                    {field: 'status', title: '状态', width: 85, selectList: {0: '下架', 1: '上架'}},
                    {field: 'create_time', minWidth: 80, title: '创建时间', search: 'range', width: 180},
                    {
                        width: 80,
                        title: '操作',
                        templet: ea.table.tool,
                        operat: [
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
        stock: function () {
            ea.listen();
        },
    };
    return Controller;
});
