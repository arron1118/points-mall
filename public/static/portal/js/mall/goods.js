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
                contentHeight > 250 && $('.content').css({ height: contentHeight  + 'px' })
            }
        },
        created(){
            // 获取商品详情
            this.getInfos()
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
            getInfos(){
                // this.colorCategray=[
                //     {id: 1,title: '盈润款', color: '象牙白'},{id: 2,title: '盈润款', color: '象牙红'},{id: 3,title: '盈润款', color: '象牙黄'},{id: 4,title: '盈润款', color: '象牙绿'}
                // ]
                // this.colorIndex = this.colorCategray[0].id
                // this.orderParams.id = this.colorIndex
            },
            getSpecs() {
                axios.get('/goods/getSpecs', { id: 1})
            },
            order() {
                if (this.goods.attribute_list && !this.goodsSpecs) {
                    this.$message('请选择分类')
                }
                console.log(this.$refs.myRef);
                console.log(this.num)
                console.log(this.goodsSpecs)
                this.orderParams.num = this.num
                console.log('this.orderParams', this.orderParams)

                // todo 传商品id下单
                // axios.post('https://www.baidu.com', {username: 'lqp', age: 18}).then(res => {
                //     console.log(res)
                // window.location.href = './order.html'

                // }).catch(err => {
                //     console.log(err)
                // })
            }
        }
    })
})(jQuery, window))
