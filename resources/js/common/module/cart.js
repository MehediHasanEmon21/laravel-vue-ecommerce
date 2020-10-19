import Axios from "axios"

export const cart = {
    namespaced: true,
    state: {
        products: {},

    },

    getters: {
        productList(state) {
            return state.products
        },

    },

    actions: {
        productList(context) {
            Axios.get('/cart/cart-products')
                .then((result) => {
                    context.commit('productList', result.data)
                }).catch((err) => {

                });

        },
        // deleteProduct(context, payload) {
        //     Axios.delete('/admin/product/' + payload.id)
        //         .then((result) => {
        //             context.commit('productList', result.data.products)
        //         })
        // },
        // getSingleProduct(context, payload) {
        //     Axios.get(`/admin/product/${payload}/edit`)
        //         .then((result) => {
        //             context.commit('getSingleProduct', result.data.product)
        //         })

        // },





    },

    mutations: {
        productList(state, payload) {
            return state.products = payload
        }


    }

}
