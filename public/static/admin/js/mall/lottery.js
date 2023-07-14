define(["jquery", "easy-admin"], function ($, ea) {

    var init = {
        table_elem: '#currentTable',
        table_render_id: 'currentTableRenderId',
        index_url: 'mall.lottery/index',
        add_url: 'mall.lottery/add',
        edit_url: 'mall.lottery/edit',
        delete_url: 'mall.lottery/delete',
        export_url: 'mall.lottery/export',
        modify_url: 'mall.lottery/modify',
    };

    var Controller = {

        index: function () {
            ea.table.render({
                init: init,
                toolbar: ['refresh', 'delete', 'export'],
                cols: [[
                    {type: "checkbox"},
                    {field: 'id', width: 80, title: 'ID'},
                    {field: 'title', minWidth: 80, title: '名称'},
                    {field: 'detail', minWidth: 80, title: '描述', search: false,},
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
