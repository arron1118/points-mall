define((function ($, window) {
    return new Vue({
        el: '#passwordApp',
        data: function () {
            let checkAreas = (rule, value, callback) => {
                if (value === '') {
                    callback(new Error('请选择省市区'));
                } else {
                    callback();
                }
            };
            let checkAddress = (rule, value, callback) => {
                if (value === '') {
                    callback(new Error('请输入详细地址'));
                } else {
                    callback();
                }
            };
            let checkName = (rule, value, callback) => {
                if (value === '') {
                    callback(new Error('请选择省市区'));
                } else {
                    callback();
                }
            };
            let checkPhone = (rule, value, callback) => {
                if (!code(value)) {
                    callback(new Error('请输入正确的手机号!'));
                } else {
                    callback();
                }
            };
            let code = (phone) => {

                let telVerify = /^1[3456789]{1}\d{9}$/;
                // 验证是验证手机号码为11位，且以1开头。
                return telVerify.test(phone)
            }
            return {
                isAdd: true,
                tableData: [],
                stepFormOne: {
                    id: '',
                    receiver_phone: '',
                    region_list: [],
                    receiver_address: '',
                    receiver_name: '',
                },
                stepFormOneRules: {
                    region_list: [
                        {validator: checkAreas, required: true, trigger: 'blur'}
                    ],
                    receiver_phone: [
                        {validator: checkPhone, required: true, trigger: 'blur'}
                    ],
                    address: [
                        {validator: checkAddress, required: true, trigger: 'blur'}
                    ],
                    name: [
                        {validator: checkName, required: true, trigger: 'blur'}
                    ]
                },
                defaultAddress: false,
                props: {
                    label: 'region_name',
                    value: 'id',
                    lazy: true, // 动态加载数据
                    lazyLoad: this.getRegion,
                },
                formRef: 'stepFormOne',
            }
        },
        mounted() {
            this.getTableList()
            // this.stepFormOne.region_list = [1, 2, 7085]
        },
        methods: {
            handleChange(v) {
                console.log(v)
            },
            // 选择省市区
            getRegion(node, resolve) {
                console.log(node)
                axios({
                    url: '/AnalysisRegion/getRegion',
                    params: {
                        pid: node.value,
                    },
                }).then(res => {
                    let data = res.data.data
                    data.forEach((value, index) => {
                        // 截止到第三层
                        data[index].leaf = node.level >= 2
                    })

                    resolve(data)
                });
            },
            // 提交
            onSubmit() {
                this.$refs[this.formRef].validate((valid) => {
                    if (valid) {
                        let messages = {},
                            url = this.isAdd ? '/address/add' : '/address/edit'
                        axios.post(url, this.stepFormOne).then(res => {
                            messages.message = res.data.msg
                            if (res.data.code) {
                                messages.type = 'success'

                                this.isAdd = true
                                this.$refs[this.formRef].resetFields()
                                this.getTableList()
                            } else {
                                messages.type = 'error'
                            }
                        })

                        this.$message(messages)
                    } else {
                        this.$message('完善信息后再提交')
                        return false;
                    }
                });
            },
            getTableList() {
                axios({
                    url: '/address/getAddressList',
                    params: {}
                }).then(res => {
                    if (res.data.code) {
                        this.tableData = res.data.data
                    }
                })
            },
            set(v) {
                if (v == undefined) {
                    return
                }
                // 设为默认
                let message = {}
                axios.post('/address/setDefaultAddress', { id: v.id }).then(res => {
                    message.message = res.data.msg
                    if (res.data.code) {
                        message.type = 'success'
                        this.getTableList()
                    } else {
                        message.type = 'error'
                    }
                }).catch(err => {
                    console.log(err)
                })
                this.$message(message)

            },
            del(v) {
                this.$confirm('此操作将永久删除该数据, 是否继续?', '提示', {
                    confirmButtonText: '确定',
                    cancelButtonText: '取消',
                    type: 'warning'
                }).then(() => {
                    let message = {}
                    axios.post('/address/del', { id: v.id }).then(res => {
                        message.message = res.data.msg
                        if (res.data.code) {
                            message.type = 'success'
                            this.getTableList()
                        } else {
                            message.type = 'error'
                        }
                    }).catch(err => {
                        console.log(err)
                    })
                    this.$message(message)
                }).catch(() => {
                    // this.$message({
                    //     type: 'info',
                    //     message: '已取消删除'
                    // });
                });
            },
            edit(v) {
                this.isAdd = false
                this.stepFormOne = Object.assign({}, this.stepFormOne, v)
            },
            add() {
                this.isAdd = true
                this.$refs[this.formRef].resetFields()
            },
        }
    })
})(jQuery, window))
