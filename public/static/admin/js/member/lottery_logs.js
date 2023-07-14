define(["jquery", "easy-admin"], function ($, ea) {

    var init = {
        table_elem: '#currentTable',
        table_render_id: 'currentTableRenderId',
        index_url: 'member.lottery_logs/index',
        add_url: 'member.lottery_logs/add',
        edit_url: 'member.lottery_logs/edit',
        delete_url: 'member.lottery_logs/delete',
        modify_url: 'member.lottery_logs/modify',
        export_url: 'member.lottery_logs/export',
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
                    {field: 'lottery.title', minWidth: 80, title: '抽奖名称'},
                    {field: 'lottery_prizes.title', minWidth: 80, title: '奖品'},
                    {field: 'create_time', minWidth: 80, title: '创建时间', search: 'range'},
                    {
                        width: 250,
                        title: '操作',
                        templet: ea.table.tool,
                        operat: [
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
