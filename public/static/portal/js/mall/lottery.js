define((function ($, window) {
    const Controller = {
        index: function () {
            return new Vue({
                el: '#drawApp',
                data() {
                    // 背景
                    const blocksImg = {
                        src: '/static/portal/imgs/c2.png',
                        width: '100%',
                        height: '100%'
                    }
                    // 奖品
                    // const prizeImg =
                    // {
                    //     src: './imgs/71-63.gif',
                    //     width: '60%',
                    //     height: '60%',
                    //     top: '22%'
                    // }
                    // 按钮
                    const buttonsImg = {
                        src: '/static/portal/imgs/buttons.png',
                        width: '100%',
                        top: '5%'
                    }

                    const rows = 4
                    const cols = 4

                    return {
                        dialogTableVisible: false,
                        rows: rows,
                        cols: cols,
                        blocks: [{ padding: '30px', imgs: [blocksImg] }], //背景
                        prizes: [], // 奖品
                        // web
                        width: (120 * cols) + 'px',
                        height: (105 * rows) + 'px',
                        buttons: [ // 按钮
                            {
                                x: 1,
                                y: 1,
                                imgs: [buttonsImg],
                                fonts: [{ text: '*每抽奖一次将消耗50积分', fontColor: '#fff', fontSize: '15px', top: '85%' }],
                                row: rows > 2 ? rows - 2 : 1,
                                col: cols > 2 ? cols - 2 : 1,
                            }
                        ],
                        // 移动端
                        width2: '390px',
                        height2: '340px',
                        buttons2: [
                            {
                                x: 1,
                                y: 1,
                                imgs: [buttonsImg],
                                fonts: [{ text: '*每抽奖一次将消耗50积分', fontColor: '#fff', fontSize: '12px', top: '85%' }],
                                row: rows > 2 ? rows - 2 : 1,
                                col: cols > 2 ? cols - 2 : 1,
                            }
                        ],
                        isPhone: false, // 判断设备
                        draw:{} // 转盘获奖信息
                    }
                },
                created() {
                    this.isPhone = this.IsPhone()
                    this.prizeItems()
                },
                methods: {
                    prizeItems(){
                        var prizeImg = {
                            src: '/static/portal/imgs/71-63.gif',
                            width: '60%',
                            height: '60%',
                            top: '22%'
                        }

                        let prizes = [],
                            rows = this.rows,
                            cols = this.cols;

                        for (let i = 0; i < cols; i ++) {
                            for (let j = 0; j < rows; j ++) {
                                if (i < cols - 1) {
                                    prizes.push({ x: i, y: j, range: i + j, imgs: [prizeImg], fonts: [{ text: '' + i + j, top: '20%', fontColor: 'red' }], background: '#fef0ef', shadow: '0px 10px 0px #ffc4b8' })
                                    break;
                                } else if (j < rows - 1) {
                                    prizes.push({ x: i, y: j, range: i + j, imgs: [prizeImg], fonts: [{ text: '' + i + j, top: '20%', fontColor: 'red' }], background: '#fef0ef', shadow: '0px 10px 0px #ffc4b8' })
                                }
                            }
                        }

                        for (let i = cols - 1; i >= 0; i --) {
                            for (let j = rows - 1; j >= 0; j --) {
                                if (i > 0) {
                                    prizes.push({ x: i, y: j, range: i + j, imgs: [prizeImg], fonts: [{ text: '' + i + j, top: '20%', fontColor: 'red' }], background: '#fef0ef', shadow: '0px 10px 0px #ffc4b8' })
                                    break;
                                } else if (j > 0) {
                                    prizes.push({ x: i, y: j, range: i + j, imgs: [prizeImg], fonts: [{ text: '' + i + j, top: '20%', fontColor: 'red' }], background: '#fef0ef', shadow: '0px 10px 0px #ffc4b8' })
                                }
                            }
                        }

                        this.prizes = prizes
                    },
                    getPrize(){
                        this.dialogTableVisible = false
                    },
                    IsPhone() {
                        var info = navigator.userAgent;
                        console.log('userAgent', info)
                        //通过正则表达式的test方法判断是否包含“Mobile”字符串
                        var isPhone = /mobile/i.test(info);
                        //如果包含“Mobile”（是手机设备）则返回true
                        return isPhone;
                    },
                    // 点击抽奖按钮会触发star回调
                    startCallback(value) {
                        console.log(this)
                        if (value == 'myLucky2') {
                            // 调用抽奖组件的play方法开始游戏
                            this.$refs.myLucky2.play()
                            // 模拟调用接口异步抽奖
                            setTimeout(() => {
                                // 假设后端返回的中奖索引是0
                                // const index = 0
                                // 调用stop停止旋转并传递中奖索引
                                this.$refs.myLucky2.stop()

                            }, 3000)
                        } else {
                            // 调用抽奖组件的play方法开始游戏
                            this.$refs.myLucky.play()
                            // 模拟调用接口异步抽奖
                            setTimeout(() => {
                                // 假设后端返回的中奖索引是0
                                // const index = 0
                                // 调用stop停止旋转并传递中奖索引
                                this.$refs.myLucky.stop()

                            }, 3000)
                        }
                    },
                    // 抽奖结束会触发end回调
                    endCallback(prize) {
                        console.log(prize)
                        this.dialogTableVisible = true
                        this.draw2 = {
                            title: '很遗憾！',
                            url: '/static/portal/imgs/none.png',
                            content: '很遗憾，',
                            prize: '未中奖，再试一次吧？',
                            btn: '谢谢参与'
                        }
                        this.draw = {
                            title: '中奖啦！',
                            url: prize.imgs[0].src, // './imgs/draw-product.png'
                            content: '恭喜你，',
                            prize: prize.fonts[0].text, // '获得applewatch一台！'
                            btn: '立即领取'
                        }
                    },

                }
            })
        }
    }

    return Controller
})(jQuery, window))
