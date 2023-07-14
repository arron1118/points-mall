define(["jquery", "easy-admin"], function ($, ea) {

    var init = {
        table_elem: '#currentTable',
        table_render_id: 'currentTableRenderId',
        index_url: 'company.users/index',
        add_url: 'company.users/add',
        edit_url: 'company.users/edit',
        delete_url: 'company.users/delete',
        modify_url: 'company.users/modify',
        export_url: 'company.users/export',
        password_url: 'company.users/password',
    };

    var Controller = {

        index: function () {

            ea.table.render({
                init: init,
                cols: [[
                    {type: "checkbox"},
                    {field: 'id', width: 80, title: 'ID'},
                    {field: 'sort', width: 80, title: '排序', edit: 'text'},
                    {field: 'username', minWidth: 80, title: '登录账户'},
                    {field: 'head_img', minWidth: 80, title: '头像', search: false, templet: ea.table.image},
                    {field: 'phone', minWidth: 80, title: '手机'},
                    {field: 'login_num', minWidth: 80, title: '登录次数'},
                    {field: 'is_self_company_text', minWidth: 80, title: '是否自营'},
                    {field: 'status', title: '状态', width: 85, search: 'select', selectList: {0: '禁用', 1: '启用'}, templet: ea.table.switch},
                    {field: 'create_time', minWidth: 80, title: '创建时间', search: 'range'},
                    {
                        width: 250,
                        title: '操作',
                        templet: ea.table.tool,
                        operat: [
                            'edit',
                            [{
                                text: '设置密码',
                                url: init.password_url,
                                method: 'open',
                                auth: 'password',
                                class: 'layui-btn layui-btn-normal layui-btn-xs',
                            }],
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
