define((function ($, window) {
    const Controller = {

        index: function () {

        },

        login: function () {
            return new Vue({
                el: '#loginApp',
                data: function () {
                    let checkPassword = (rule, value, callback) => {
                        if (value === '') {
                            callback(new Error('请输入密码'));
                        } else {
                            callback();
                        }
                    };
                    let checkCode = (rule, value, callback) => {
                        if (value === '') {
                            callback(new Error('请输入验证码'));
                        } else {
                            callback();
                        }
                    };
                    let checkUsername = (rule, value, callback) => {
                        if (value === '') {
                            callback(new Error('请输入用户名'));
                        } else {
                            callback();
                        }
                    };
                    return {
                        form: {
                            captcha: "",
                            phone: "",
                            password: ""
                        },
                        formRules: {
                            phone: [
                                { validator: checkUsername, trigger: 'blur' }
                            ],
                            captcha: [
                                { validator: checkCode, trigger: 'blur' }
                            ],
                            password: [
                                { validator: checkPassword, trigger: 'blur' }
                            ],
                        },
                        captcha: '',
                    }

                },
                created() {
                    this.getCaptcha()
                },
                methods:{
                    onSubmit(formName){
                        this.$refs[formName].validate((valid) => {
                            if (valid) {
                                // 成功后跳转
                                axios.post('/doLogin', this.form).then(res => {
                                    let messages = { message: res.data.msg }
                                    if (res.data.code) {
                                        messages.type = 'success'
                                        messages.onClose = () => window.location.href = '/index.html'
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
                    getCaptcha(){
                        axios({
                            url: '/index/captcha',
                        }).then(res => {
                            this.captcha = res.data + '?v=' + Math.random()
                        })
                    }
                }
            })
        },

        register: function () {
            return new Vue({
                el: '#registerApp',
                data: function () {
                    let validatePass1 = (rule, value, callback) => {
                        if (value === '') {
                            callback(new Error('请输入密码'));
                        } else if (value < 6) {
                            callback(new Error('请输入长度6-16位密码'));
                        } else {
                            callback();
                        }
                    };
                    let validatePass2 = (rule, value, callback) => {
                        if (value === '') {
                            callback(new Error('请再次输入密码'));
                        } else if (value !== this.stepFormOne.password) {
                            callback(new Error('两次输入密码不一致!'));
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
                        stepFormOne: {
                            phone: '',
                            password: '',
                            confirm_password: '',
                        },
                        stepFormOneRules: {
                            confirm_password: [
                                { validator: validatePass2, trigger: 'blur' }
                            ],
                            phone: [
                                { validator: checkPhone, trigger: 'blur' }
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
                                if (this.stepFormOne.password !== this.stepFormOne.confirm_password) {
                                    return this.$message('两次密码输入不一致')
                                }

                                axios.post('/doRegister', this.stepFormOne).then(res => {
                                    let messages = {message: res.data.msg}

                                    if (res.data.code) {
                                        messages.type = 'success'
                                        // 成功后跳转
                                        window.location.href = res.data.url
                                    } else {
                                        messages.type = 'warning'
                                        this.$message(messages)
                                    }
                                }).catch(err => {
                                    console.log(err)
                                });

                            } else {
                                console.log('error submit!!');
                                return false;
                            }
                        });
                    },
                    getCode(){
                        this.$message({
                            type: 'success',
                            message: '获取验证码成功!'
                        });
                    }
                }
            })
        }
    }

    return Controller
})(jQuery, window))
