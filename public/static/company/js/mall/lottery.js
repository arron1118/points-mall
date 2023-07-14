define(["jquery", "easy-admin"], function ($, ea) {

    let laydate = layui.laydate,
        tableSelect = layui.tableSelect,
        form = layui.form,
        upload = layui.upload;

    let init = {
        table_elem: '#currentTable',
        table_render_id: 'currentTableRenderId',
        index_url: 'mall.lottery/index',
        add_url: 'mall.lottery/add',
        edit_url: 'mall.lottery/edit',
        delete_url: 'mall.lottery/delete',
        export_url: 'mall.lottery/export',
        modify_url: 'mall.lottery/modify',
        upload_url: 'ajax/upload',
        upload_exts: 'doc|gif|ico|icon|jpg|mp3|mp4|p12|pem|png|rar',
    };

    let Controller = {

        index: function () {
            ea.table.render({
                init: init,
                toolbar: ['refresh',
                    [{
                        text: '添加',
                        url: init.add_url,
                        method: 'open',
                        auth: 'add',
                        class: 'layui-btn layui-btn-normal layui-btn-sm',
                        icon: 'fa fa-plus ',
                        extend: 'data-full="true"',
                    }], 'delete', 'export'],
                cols: [[
                    {type: "checkbox"},
                    {field: 'id', width: 80, title: 'ID'},
                    {field: 'title', minWidth: 80, title: '名称'},
                    {field: 'detail', minWidth: 80, title: '描述', search: false,},
                    {field: 'start_time', minWidth: 80, title: '开始时间', search: false,},
                    {field: 'end_time', minWidth: 80, title: '结束时间', search: false,},
                    {field: 'create_time', minWidth: 80, title: '创建时间', search: false,},
                    {
                        width: 250,
                        title: '操作',
                        templet: ea.table.tool,
                        operat: [
                            [{
                                text: '编辑',
                                url: init.edit_url,
                                method: 'open',
                                auth: 'edit',
                                class: 'layui-btn layui-btn-xs layui-btn-success',
                                extend: 'data-full="true"',
                            }], 'delete']
                    }
                ]],
            });

            ea.listen();
        },
        add: function () {
            laydate.render({
                elem: '#startDate',
                range: '-',
                type: 'datetime',
                min: Controller.getDateTime(),
                done: function (value, date, endDate) {
                    let d = value.split(' - ')
                }
            })

            Controller.selectGoods();

            Controller.upload();

            form.on('select(select-type)', function (data) {
                // 选择商品
                $(data.elem).closest('tr').find('.select-goods').prop('disabled', parseInt(data.value) !== 4)
            })

            $('.clear-prize-btn').on('click', function (e) {
                $(this).closest('tr').find('input').val('')
                $(this).closest('tr').find('select').val('')
            })

            ea.listen();
        },
        edit: function () {
            laydate.render({
                elem: '#startDate',
                range: '-',
                type: 'datetime',
                min: Controller.getDateTime(),
                done: function (value, date, endDate) {
                    let d = value.split(' - ')
                }
            })

            Controller.selectGoods();

            Controller.upload();

            form.on('select(select-type)', function (data) {
                // 选择商品
                $(data.elem).closest('tr').find('.select-goods').prop('disabled', parseInt(data.value) !== 4)
            })

            $('.clear-prize-btn').on('click', function (e) {
                $(this).closest('tr').find('input').val('')
                $(this).closest('tr').find('select').val('')
                $(this).closest('tr').find('img').prop('src', '')
            })

            ea.listen();
        },

        /**
         * 获取格式化时间
         *
         * @param param
         * @returns {string}
         */
        getDateTime: function (param = {}) {
            let defaultParam = {
                year: 0,
                month: 0,
                day: 0,
                hour: 0,
                minute: 0,
                second: 0
            };
            param = Object.assign(defaultParam, param)
            let d = new Date(),
                year = d.getFullYear() + param.year,
                month = d.getMonth() + 1 + param.month,
                day = d.getDate() + param.day,
                hour = d.getHours() + param.hour,
                minute = d.getMinutes() + param.minute,
                second = d.getSeconds() + param.second;

            if (month < 10) {
                month = '0' + month;
            }

            if (day < 10) {
                day = '0' + day;
            }

            if (hour < 10) {
                hour = '0' + hour;
            }

            if (minute < 10) {
                minute = '0' + minute;
            }

            if (second < 10) {
                second = '0' + second;
            }

            return year + '-' + month + '-' + day + ' ' + hour + ':' + minute + ':' + second;
        },
        upload: function () {
            let uploadList = document.querySelectorAll("[data-image]");
            let uploadSelectList = document.querySelectorAll("[data-image-select]");

            if (uploadList.length > 0) {
                $.each(uploadList, function (i, v) {
                    let uploadExts = $(this).attr('data-image-exts') || init.upload_exts,
                        uploadName = $(this).attr('data-image'),
                        uploadNumber = $(this).attr('data-image-number') || 'one',
                        uploadSign = $(this).attr('data-image-sign') || '|',
                        uploadAccept = $(this).attr('data-image-accept') || 'file',
                        uploadAcceptMime = $(this).attr('data-image-mimetype') || '',
                        elem = "input[name='" + uploadName + "']",
                        uploadElem = this;

                    // 监听上传事件
                    upload.render({
                        elem: $(uploadElem),
                        url: ea.url(init.upload_url),
                        exts: uploadExts,
                        accept: uploadAccept,//指定允许上传时校验的文件类型
                        acceptMime: uploadAcceptMime,//规定打开文件选择框时，筛选出的文件类型
                        multiple: uploadNumber !== 'one',//是否多文件上传
                        headers: ea.headers(),
                        done: function (res) {
                            if (res.code === 1) {
                                let url = res.data.url;
                                if (uploadNumber !== 'one') {
                                    let oldUrl = $(elem).val();
                                    if (oldUrl !== '') {
                                        url = oldUrl + uploadSign + url;
                                    }
                                }
                                $(elem).val(url);
                                $(elem).trigger("input");
                                ea.msg.success(res.msg);
                            } else {
                                ea.msg.error(res.msg);
                            }
                            return false;
                        }
                    });

                    // 监听上传input值变化
                    $(elem).bind("input propertychange", function (event) {
                        let urlString = $(this).val()

                        $('#bing-' + uploadName).remove();
                        if (urlString.length > 0) {
                            $(this).closest('tr').find('img').prop('src', urlString)
                        }
                    });

                    // 非空初始化图片显示
                    if ($(elem).val() !== '') {
                        $(elem).trigger("input");
                    }
                });

                // 监听上传文件的删除事件
                $('body').on('click', '[data-image-delete]', function () {
                    let uploadName = $(this).attr('data-image-delete'),
                        deleteUrl = $(this).attr('data-image-url'),
                        sign = $(this).attr('data-image-sign');
                    let confirm = ea.msg.confirm('确定删除？', function () {
                        let elem = "input[name='" + uploadName + "']";
                        let currentUrl = $(elem).val();
                        let url = '';
                        if (currentUrl !== deleteUrl) {
                            url = currentUrl.search(deleteUrl) === 0 ? currentUrl.replace(deleteUrl + sign, '') : currentUrl.replace(sign + deleteUrl, '');
                            $(elem).val(url);
                            $(elem).trigger("input");
                        } else {
                            $(elem).val(url);
                            $('#bing-' + uploadName).remove();
                        }
                        ea.msg.close(confirm);
                    });
                    return false;
                });
            }

            if (uploadSelectList.length > 0) {
                $.each(uploadSelectList, function (i, v) {
                    let uploadName = $(this).attr('data-image-select'),
                        uploadNumber = $(this).attr('data-image-number') || 'one',
                        uploadSign = $(this).attr('data-image-sign') || '|';

                    let selectCheck = uploadNumber === 'one' ? 'radio' : 'checkbox';
                    let elem = "input[name='" + uploadName + "']",
                        uploadElem = $(this).attr('id');

                    tableSelect.render({
                        elem: "#" + uploadElem,
                        checkedKey: 'id',
                        searchType: 'more',
                        searchList: [
                            {searchKey: 'title', searchPlaceholder: '请输入文件名'},
                        ],
                        table: {
                            url: ea.url('ajax/getUploadFiles'),
                            cols: [[
                                {type: selectCheck},
                                {field: 'id', title: 'ID'},
                                {field: 'url', minWidth: 80, search: false, title: '图片信息', imageHeight: 40, align: "center", templet: ea.table.image},
                                {field: 'original_name', width: 150, title: '文件原名', align: "center"},
                                {field: 'mime_type', width: 120, title: 'mime类型', align: "center"},
                                {field: 'create_time', width: 200, title: '创建时间', align: "center", search: 'range'},
                            ]]
                        },
                        done: function (e, data) {
                            let urlArray = [];
                            $.each(data.data, function (index, val) {
                                urlArray.push(val.url)
                            });
                            let url = urlArray.join(uploadSign);
                            $(elem).val(url);
                            $(elem).trigger("input");
                        }
                    })

                });

            }
        },
        selectGoods: function () {
            let selectList = document.querySelectorAll("[data-goods-select]");

            if (selectList.length > 0) {
                $.each(selectList, function (i, v) {
                    let uploadName = $(this).attr('data-goods-select'),
                        uploadNumber = $(this).attr('data-goods-number') || 'one',
                        uploadSign = $(this).attr('data-goods-sign') || '|';

                    let selectCheck = uploadNumber === 'one' ? 'radio' : 'checkbox';
                    let elem = "input[name='" + uploadName + "']",
                        uploadElem = $(this).attr('id');

                    tableSelect.render({
                        elem: "#" + uploadElem,
                        checkedKey: 'id',
                        searchType: 'more',
                        searchList: [
                            {searchKey: 'title', searchPlaceholder: '商品标题'},
                        ],
                        table: {
                            url: ea.url('mall.goods/index'),
                            cols: [[
                                {type: selectCheck},
                                {field: 'id', title: 'ID'},
                                {field: 'logo', minWidth: 80, search: false, title: 'logo', imageHeight: 40, align: "center", templet: ea.table.image},
                                {field: 'title', width: 150, title: '标题', align: "center"},
                                {field: 'total_stock', width: 120, title: '总库存', align: "center"},
                                {field: 'integral', width: 100, title: '积分', align: "center"},
                                {field: 'market_price', width: 100, title: '市场价', align: "center"},
                                {field: 'sales', width: 100, title: '销量', align: "center"},
                            ]]
                        },
                        done: function (e, data) {
                            let urlArray = [],
                                tr = $(elem).closest('tr');
                            $.each(data.data, function (index, val) {
                                urlArray.push(val.logo)
                            });
                            let url = urlArray.join(uploadSign);
                            $(elem).val(data.data[0].id)
                            tr.find('.prize-img').val(url);
                            tr.find('.prize-img').trigger("input");
                            tr.find('.prize-title').val(data.data[0].title)
                        }
                    })

                });
            }
        },
    };
    return Controller;
});
