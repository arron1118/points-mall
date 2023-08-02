define((function ($, window) {
    return new Vue({
        el: '#numberApp',
        data: function () {
            // let clientHeight = Utils.getClientHeight()

            return {
                num: 1,
                colorIndex: 0, // 默认选中0项商品
                colorCategray: [],
                orderParams: {},
                goods: null,
                goodsCopy: null,
                goodsSpecs: null,
                errMessage: '',
                errHeight: 'auto',
                clientHeight: 0,
            }
        },
        watch: {
            clientHeight: function (n, o) {
                let contentHeight = this.clientHeight - document.getElementsByClassName('header')[0].offsetHeight - document.getElementsByClassName('footer')[0].offsetHeight
                contentHeight > 250 && $('.content').css({ minHeight: contentHeight  + 'px' })
            }
        },
        created(){
            // 获取商品详情
            this.clientHeight = Utils.getClientHeight()
        },
        mounted() {
            const that = this
            window.onresize = function () {
                that.clientHeight = Utils.getClientHeight()
            }

            let params = new URLSearchParams(new URL(window.location.href).search.slice(1))
            let id = params.get('id')

            if (!id) {
                this.$message({
                    type: 'error',
                    message: '参数有误',
                })
            }

            axios({
                url: '/goods/getDetail',
                params: {
                    id: id
                }
            }).then(res => {
                if (res.data.code) {
                    this.goods = res.data.data
                    this.goodsCopy = Object.assign({}, res.data.data)
                } else {
                    this.errMessage = res.data.msg
                }
            });
        },
        methods:{
            changeColorCategray(item, index){
                this.colorIndex = this.colorIndex === index ? 0 : index
                this.orderParams.specs_id = this.orderParams.specs_id === index ? 0 : index

                if (this.colorIndex) {
                    let goodsSpecs = this.goods.goodsSpecs.filter((val, i) => val.specs_list.includes(item))
                    if (goodsSpecs.length) {
                        this.goods.total_stock = goodsSpecs[0].stock
                        this.goods.market_price = goodsSpecs[0].market_price
                        this.goods.integral = goodsSpecs[0].integral
                        this.goodsSpecs = goodsSpecs[0]
                    }
                } else {
                    this.goods.total_stock = this.goodsCopy.total_stock
                    this.goods.market_price = this.goodsCopy.market_price
                    this.goods.integral = this.goodsCopy.integral
                    this.goodsSpecs = null
                }
            },
            order() {
                let params = {}
                if (this.goods.attribute_list && !this.goodsSpecs) {
                    this.$message('请选择分类');
                }

                axios({
                    url: '/goods/checkUserIntegral',
                    params: {
                        quantity: this.num,
                        integral: this.goodsSpecs.integral
                    },
                    method: 'post',
                }).then(res => {
                    window.location.href = '/order.html?goods_id=' + this.goods.id + '&goods_specs_id=' + this.goodsSpecs.id + '&quantity=' + this.num

                    // if (res.data.data) {
                    //     window.location.href = '/order.html?goods_id=' + this.goods.id + '&goods_specs_id=' + this.goodsSpecs.id + '&quantity=' + this.num
                    // } else {
                    //     this.$notify({
                    //         message: '您的积分不足以兑换该商品',
                    //         type: 'info',
                    //     })
                    // }
                })

            }
        }
    })
})(jQuery, window))
