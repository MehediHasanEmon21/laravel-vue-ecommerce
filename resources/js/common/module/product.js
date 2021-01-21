import Axios from "axios"

export const product = {
    namespaced: true,
    state: {
        products: {},
        product: {},
        sideBarInfo: {}
    },

    getters: {
        productList(state) {
            return state.products
        },
        getSingleProduct(state) {
            return state.product
        },
        productSidebarInfo(state) {
            return state.sideBarInfo
        },
    },

    actions: {
        productList(context, payload) {
            Axios.get('/admin/product?page=' + payload)
                .then((result) => {
                    context.commit('productList', result.data.products)
                }).catch((err) => {

                });

        },

        deleteProduct(context, payload) {
            Axios.delete('/admin/product/' + payload.id)
                .then((result) => {
                    context.commit('productList', result.data.products)
                })
        },
        getSingleProduct(context, payload) {
            Axios.get(`/admin/product/${payload}/edit`)
                .then((result) => {
                    context.commit('getSingleProduct', result.data.product)
                })

        },

        //for frontend

        getFrontendProduct(context, payload) {
            Axios.get('/product-list?page=' + payload)
                .then((result) => {
                    context.commit('productList', result.data.products)
                }).catch((err) => {

                });

        },
        getHomeProduct(context) {

            Axios.get('/home-products')
                .then((result) => {
                    context.commit('productList', result.data)
                }).catch((err) => {

                });

        },
        productSidebarInfo(context) {
            Axios.get('/product-sidebar-info')
                .then((result) => {
                    context.commit('productSidebarInfo', result.data)
                }).catch((err) => {

                });
        },
        ProductFilter(context, paload) {
            Axios.get('/product-filter/' + paload)
                .then((result) => {
                    context.commit('ProductFilter', result.data.products)
                }).catch((err) => {

                });
        }

    },

    mutations: {
        productList(state, payload) {
            return state.products = payload
        },
        getSingleProduct(state, payload) {
            return state.product = payload
        },
        productSidebarInfo(state, payload) {
            return state.sideBarInfo = payload
        },
        ProductFilter(state, payload) {
            return state.products = payload
        }

    }

}
