define((function ($, window) {
    const Controller = {
        password: function () {
            return   new Vue({
                el: '#passwordApp',
                data: function () {
                    var validatePass1 = (rule, value, callback) => {
                        if (value === '') {
                            callback(new Error('请输入密码'));
                        } else if (value < 6) {
                            callback(new Error('请输入长度6-16位密码'));
                        } else {
                            callback();
                        }
                    };
                    return {
                        stepFormOne: {
                            password: '',
                            password_confirm: '',
                        },
                        stepFormOneRules: {
                            password_confirm: [
                                { validator: validatePass1, trigger: 'blur' }
                            ],
                            password: [
                                { validator: validatePass1, trigger: 'blur' }
                            ],
                        },
                    }
                },
                methods: {
                    // 提交
                    onSubmit(formName) {
                        this.$refs[formName].validate((valid) => {
                            if (valid) {
                                axios.post('/account/resetPassword', this.stepFormOne).then(res => {
                                    let messages = { message: res.data.msg }
                                    if (res.data.code) {
                                        messages.type = 'success'
                                    } else {
                                        messages.type = 'warning'
                                    }

                                    this.$message(messages)
                                }).catch(err => {
                                    console.log(err)
                                })

                            } else {
                                console.log('error submit!!');
                                return false;
                            }
                        });
                    },
                }
            })
        },
    }

    return Controller
})(jQuery, window))
