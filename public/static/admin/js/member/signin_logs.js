define(["jquery", "easy-admin"], function ($, ea) {

    var init = {
        table_elem: '#currentTable',
        table_render_id: 'currentTableRenderId',
        index_url: 'member.signin_logs/index',
        add_url: 'member.signin_logs/add',
        edit_url: 'member.signin_logs/edit',
        delete_url: 'member.signin_logs/delete',
        modify_url: 'member.signin_logs/modify',
        export_url: 'member.signin_logs/export',
    };

    var Controller = {

        index: function () {

            ea.table.render({
                init: init,
                toolbar: ['refresh', 'export'],
                cols: [[
                    {type: "checkbox"},
                    {field: 'id', width: 80, title: 'ID'},
                    {field: 'users.username', minWidth: 80, title: '用户名称'},
                    {field: 'ip', minWidth: 80, title: 'IP'},
                    {field: 'platform', minWidth: 80, title: '设备'},
                    {field: 'create_time', minWidth: 80, title: '创建时间', search: 'range'},
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
