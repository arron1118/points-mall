define(["jquery", "easy-admin"], function ($, ea) {

    var init = {
        table_elem: '#currentTable',
        table_render_id: 'currentTableRenderId',
        index_url: 'mall.orders/index',
        add_url: 'mall.orders/add',
        edit_url: 'mall.orders/edit',
        delete_url: 'mall.orders/delete',
        export_url: 'mall.orders/export',
        modify_url: 'mall.orders/modify',
    };

    var Controller = {

        index: function () {
            ea.table.render({
                init: init,
                toolbar: ['refresh', 'export'],
                cols: [[
                    {type: "checkbox"},
                    {field: 'id', width: 80, title: 'ID'},
                    {field: 'order_no', width: 250, title: '订单号'},
                    {field: 'orderItems[0].img', minWidth: 80, title: '图片', templet: ea.table.image},
                    {field: 'orderItems[0].title', minWidth: 80, title: '商品名称'},
                    {field: 'users.username', minWidth: 80, title: '用户'},
                    {field: 'orderItems[0].quantity', minWidth: 50, title: '数量', search: false,},
                    {field: 'integral', minWidth: 80, title: '积分', search: false,},
                    {field: 'postage', minWidth: 80, title: '运费', search: false,},
                    {field: 'status', title: '状态', width: 85, selectList: {0: '未付款', 1: '已付款', 2: '已发货', 3: '交易完成', 4: '交易关闭'}},
                    {field: 'create_time', minWidth: 80, title: '创建时间', search: false,},
                    {
                        width: 250,
                        title: '操作',
                        templet: ea.table.tool,
                        operat: []
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
