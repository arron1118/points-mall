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
                toolbar: ['refresh',
                    [{
                        text: '添加',
                        url: init.add_url,
                        method: 'open',
                        auth: 'add',
                        class: 'layui-btn layui-btn-normal layui-btn-sm',
                        icon: 'fa fa-plus ',
                        extend: 'data-full="true"',
                    }],
                    'delete', 'export'],
                cols: [[
                    {type: "checkbox"},
                    {field: 'id', width: 80, title: 'ID'},
                    {field: 'sort', width: 80, title: '排序', edit: 'text'},
                    {field: 'cate.title', minWidth: 80, title: '商品分类'},
                    {field: 'title', minWidth: 80, title: '商品名称'},
                    {field: 'logo', minWidth: 80, title: '分类图片', search: false, templet: ea.table.image},
                    {field: 'market_price', width: 100, title: '市场价', templet: ea.table.price},
                    {field: 'discount_price', width: 100, title: '折扣价', templet: ea.table.price},
                    {field: 'total_stock', width: 100, title: '库存统计'},
                    {field: 'stock', width: 100, title: '剩余库存'},
                    {field: 'virtual_sales', width: 100, title: '虚拟销量'},
                    {field: 'sales', width: 80, title: '销量'},
                    {field: 'status', title: '状态', width: 85, selectList: {0: '禁用', 1: '启用'}, templet: ea.table.switch},
                    {field: 'create_time', minWidth: 80, title: '创建时间', search: 'range'},
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
                            }, {
                                text: '入库',
                                url: init.stock_url,
                                method: 'open',
                                auth: 'stock',
                                class: 'layui-btn layui-btn-xs layui-btn-normal',
                            }],
                            'delete']
                    }
                ]],
            });

            ea.listen();
        },
        add: function () {
            // 商品属性
            $('body .add-property-item').on('click', function () {
                let item = $('<div />', {
                    class: 'layui-input-block',
                }).append($('<div />', { class: 'layui-inline', }).append($('<div />', {
                    class: 'layui-input-inline',
                }).append($('<input />', {
                    type: 'input',
                    name: 'property[keys][]',
                    class: 'layui-input',
                    placeholder: '属性名称',
                    value: '',
                }))).append($('<div />', { class: 'layui-form-mid', text: '：' }))
                    .append($('<div />', {
                        class: 'layui-input-inline',
                    }).append($('<input />', {
                        type: 'input',
                        name: 'property[values][]',
                        class: 'layui-input',
                        placeholder: '属性值',
                        value: '',
                    }))).append($('<div />', { class: 'layui-input-inline', }).append($('<span />', {
                        class: 'remove-property-item',
                        style: 'cursor: pointer; line-height: 36px; color: #999;',
                        title: '移除此项',
                        text: '移除',
                    }).on('click', function () {
                        $(this).closest('.layui-input-block').remove()
                    }))))

                $('.property-list').append(item)
            })

            // 销售属性
            form.on('select(category)', function (obj) {
                if (parseInt(obj.value) > 0) {
                    ea.request.post({
                        url: ea.url('mall.goods/getAttributes'),
                        data: {
                            category_id: obj.value,
                        }
                    }, function (res) {
                        if (res.data.length) {
                            let attributeHtml = $('<div />', { class: 'layui-input-block attribute-list-fetch' })
                            let t = $('<div />', { class: 'layui-form-item' })
                            $.each(res.data, function (index, item) {
                                t.append($('<label />', { class: 'layui-form-label', text: item.sku_attribute_name }))
                                    .append($('<input />', {
                                        type: 'hidden',
                                    }))
                                let b = $('<div />', { class: 'layui-input-block' })
                                $.each(item.attributeValues, function (i, val) {
                                    let randomStr = Math.random().toString(16).slice(2)
                                    b.append($('<div />', {
                                        class: 'attribute-list',
                                        style: 'display: block; float: left; width: auto; margin-right: 16px;',
                                    }).append($('<label />', {
                                        for: 'attr-' + val.id,
                                    }).append($('<input />', {
                                        type: 'checkbox',
                                        'lay-skin': 'primary',
                                        'lay-filter': 'colorCheckbox',
                                        'data-id': randomStr,
                                        name: 'goods_attribute_list[' + item.id + '][value_id][]',
                                        value: val.id,
                                        style: 'display: block; float: left; border: 1px solid #e6e6e6; width: 16px; height: 16px; margin-top: 10px; margin-right: 5px;',
                                        id: 'attr-' + val.id,
                                        click: function () {
                                            checkAttr($(this), item.sku_attribute_name, val, item.id)
                                        }
                                    })).append($('<span />', {
                                        style: 'display: block; float: left; border: 1px solid #e6e6e6; width: 16px; height: 16px; margin-top: 10px; margin-right: 5px; background-color: ' + val.sub_sku_attribute_value,
                                    }))).append($('<input />', {
                                        type: 'text',
                                        class: 'color-name',
                                        'data-id': randomStr,
                                        value: val.sku_attribute_value,
                                        style: 'float: left; margin-top: 5px; padding: 0 5px; line-height: 28px; border: 1px solid #e6e6e6;',
                                    }).on('blur', function () {
                                        let a = $('.attribute-list-table table tbody tr#' + $(this).data('id') + ' td:first')
                                        a.find('span').text($(this).val())
                                        a.find('input').val($(this).val())
                                    })))
                                })
                                t.append(b)
                            })
                            $('#attribute-content').append(attributeHtml.append(t))
                        } else {
                            $('#attribute-content').html('')
                        }
                    })
                }
            })

            let checkAttr = function (obj, group, data, pid) {
                if ($('.attribute-list input[type=checkbox]:checked').length > 0) {
                    $('.attribute-list-table').css({ display: 'block' })
                    if (!$('input[name=total_stock]').prop('disabled')) {
                        $('input[name=total_stock]').prop('disabled', true).val(0)
                    }
                } else {
                    $('.attribute-list-table').css({ display: 'none' })
                    $('input[name=total_stock]').prop('disabled', false).val(0)
                }

                if (obj.prop('checked')) {
                    let item = $('<tr />', {
                        id: obj.data('id'),
                    }).append($('<td />').append($('<input />', {
                        name: 'goods_attribute_list[' + pid + '][value_name][]',
                        value: data.sku_attribute_value,
                        type: 'hidden',
                    })).append($('<input />', {
                        name: 'attribute_list["' + group + '"][]',
                        value: data.sku_attribute_value,
                        type: 'hidden',
                        class: 'sku-attribute-value'
                    })).append($('<span />', {
                        text: data.sku_attribute_value,
                    })))
                        .append($('<td />').append($('<input />', {
                            name: 'specs_list[market_prices][]',
                            class: 'layui-input',
                            value: '',
                        })))
                        .append($('<td />').append($('<input />', {
                            name: 'specs_list[discount_prices][]',
                            class: 'layui-input',
                            value: '',
                        })))
                        .append($('<td />').append($('<input />', {
                            name: 'specs_list[integrals][]',
                            class: 'layui-input',
                            value: '',
                        })))
                        .append($('<td />').append($('<input />', {
                            name: 'specs_list[stocks][]',
                            class: 'layui-input',
                            value: 0,
                        }).on('blur', function () {
                            let ts = $('input[name=total_stock]')
                            if ($(this).val()) {
                                ts.val(parseInt(ts.val()) + parseInt($(this).val()))
                            }
                        })))

                    $('.attribute-list-table table tbody').append(item)
                } else {
                    $('.attribute-list-table table tbody tr#' + obj.data('id')).remove()
                }
            }

            let e = [
                [{ name: "院区1", number: "001" }, { name: "院区2", number: "002" }],  //对应图中条件1的数据
                [{ name: "仓库1", number: "001" }, { name: "仓库2", number: "002" }],  //对应图中条件3的数据
                [{ name: "部门1", number: "001" }, { name: "部门2", number: "002" }, { name: '部门3', number: '003'}],  //对应图中条件2的数据
            ]
            console.log(Controller.multiplyData(e))

            ea.listen();
        },
        edit: function () {
            ea.listen();
        },
        stock: function () {
            ea.listen();
        },
        multiplyData: function (newArrData) {
            let len = newArrData.length;
            // 当数组长度大于等于2时
            if (len >= 2) {
                // 第一个数组的长度
                let len1 = newArrData[0].length;
                // 第二个数组的长度
                let len2 = newArrData[1].length;
                //  申明一个新数组,做数据暂存
                let items = [];
                // 申明新数组的索引
                let index = 0;
                // 2层嵌套循环,将组合放到新数组中
                for (let i = 0; i < len1; i++) {
                    for (let j = 0; j < len2; j++) {
                        if (items.length < index + 1) {
                            items.push([])
                        }
                        if (newArrData[0][i] instanceof Array) {
                            items[index] = items[index].concat(newArrData[0][i].concat(newArrData[1][j]));
                        } else {
                            items[index] = items[index].concat([newArrData[0][i], newArrData[1][j]]);
                        }
                        index++;
                    }
                }
                // 将新组合的数组并到原数组中
                let newArr = new Array(len - 1);
                for (let i = 2; i < len; i++) {
                    newArr[i - 1] = newArrData[i];
                }
                newArr[0] = items;
                // 执行回调
                return this.multiplyData(newArr);
            } else {
                return newArrData[0];
            }
        },
    };
    return Controller;
});
