define(function($, window) {
    const Controller = {
        index: function () {
            return new Vue({
                el: '#productList',
                data: function () {
                    return {
                        productList: [],
                        total: '',
                        loading: false,
                        noMore: false,
                        page: 1,
                        keyword: '',
                    }
                },
                created() {
                    let params = new URLSearchParams(new URL(window.location.href).search.slice(1))
                    this.keyword = params.get('kw')

                    this.getGoodsList()
                },
                methods: {
                    getGoodsList() {
                        if (!this.noMore) {
                            axios({
                                url: '/goods/getGoodsList',
                                params: {
                                    page: this.page,
                                    kw: this.keyword,
                                },
                            }).then(res => {
                                this.productList = this.productList.concat(res.data.data.list)
                                this.noMore = res.data.data.noMore
                                this.total = res.data.data.total

                                ++this.page
                            });
                        }
                    }
                }
            })
        }
    }

    return Controller
}(jQuery, window))
