(function (window, $, undefined) {
    class Utils {
        CLIENT_HEIGHT;
        CLIENT_WIDTH;
        VERSION = '1.0';

        constructor() {
            this.CLIENT_HEIGHT = window.innerHeight || document.documentElement.clientHeight || document.body.clientHeight;
            this.CLIENT_WIDTH = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;
        }

        getClientHeight() {
            return window.innerHeight || document.documentElement.clientHeight || document.body.clientHeight;
        }

        getClientWidth() {
            return window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;
        }

        /**
         * 获取格式化时间
         *
         * @param param
         * @returns {string}
         */
        getDateTime(param = {}) {
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
        }

        /**
         * 设置 和 获取 cookie
         *
         * @param key
         * @param val
         * @param obj
         * @returns {string|boolean|*[]}
         */
        cookie(key = null, val = null, obj = {}) {
            if (key === null) {
                let val = [];
                let cookie = document.cookie.split('; ');
                $.each(cookie, function (index, item) {
                    let i = item.split('=');
                    val[i[0]] = i[1];
                })

                return val;
            } else {
                if (val === null) {
                    let val = '';
                    let cookie = document.cookie.split('; ');
                    $.each(cookie, function (index, item) {
                        let i = item.split('=');
                        if (i[0] === key) {
                            val = i[1];
                            return false;
                        }
                    })

                    return val;
                } else {
                    document.cookie = key + '=' + val + '; path=/';
                    return true;
                }
            }
        }

        /**
         * 检测手机号码
         *
         * @param phone
         * @returns {boolean}
         */
        isPhone(phone) {
            let pattern = /^1[3456789]\d{9}$/;
            return pattern.test(phone);
        }
    }


    window.Utils = new Utils();
})(window, jQuery)
