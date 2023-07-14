define(["jquery", "easy-admin"], function ($, ea) {

    var init = {
        table_elem: '#currentTable',
        table_render_id: 'currentTableRenderId',
        index_url: 'mall.order_payment/index',
        add_url: 'mall.order_payment/add',
        edit_url: 'mall.order_payment/edit',
        delete_url: 'mall.order_payment/delete',
        export_url: 'mall.order_payment/export',
        modify_url: 'mall.order_payment/modify',
    };

    var Controller = {

        index: function () {
            ea.table.render({
                init: init,
                toolbar: ['refresh', 'delete', 'export'],
                cols: [[
                    {type: "checkbox"},
                    {field: 'id', width: 80, title: 'ID'},
                    {field: 'order_no', width: 250, title: '订单号'},
                    {field: 'pay_platform', width: 250, title: '支付平台'},
                    {field: 'platform_no', width: 250, title: '平台单号'},
                    {field: 'user.username', minWidth: 80, title: '用户'},
                    {field: 'pay_amount', minWidth: 80, title: '支付金额', search: false,},
                    {field: 'create_time', minWidth: 80, title: '创建时间', search: false,},
                    {
                        width: 250,
                        title: '操作',
                        templet: ea.table.tool,
                        operat: ['delete']
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
