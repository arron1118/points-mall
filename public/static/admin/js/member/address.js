define(["jquery", "easy-admin"], function ($, ea) {

    var init = {
        table_elem: '#currentTable',
        table_render_id: 'currentTableRenderId',
        index_url: 'member.address/index',
        add_url: 'member.address/add',
        edit_url: 'member.address/edit',
        delete_url: 'member.address/delete',
        modify_url: 'member.address/modify',
        export_url: 'member.address/export',
    };

    var Controller = {

        index: function () {

            ea.table.render({
                init: init,
                toolbar: ['refresh', 'delete', 'export'],
                cols: [[
                    {type: "checkbox"},
                    {field: 'id', width: 80, title: 'ID'},
                    {field: 'users.username', minWidth: 80, title: '用户名称'},
                    {field: 'receiver_name', minWidth: 80, title: '收获人'},
                    {field: 'receiver_phone', minWidth: 80, title: '联系电话'},
                    {field: 'receiver_address', minWidth: 80, title: '地址'},
                    {field: 'create_time', minWidth: 80, title: '创建时间', search: 'range'},
                    {
                        width: 250,
                        title: '操作',
                        templet: ea.table.tool,
                        operat: [
                            'edit',
                            'delete'
                        ]
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
        password: function () {
            ea.listen();
        }
    };
    return Controller;
});
