import Axios from "axios"

export const order = {
    namespaced: true,
    state: {

        orderList: {},
        order: {}

    },

    getters: {

        orderList(state) {
            return state.orderList
        },
        order(state) {
            return state.order
        }

    },

    actions: {

        orderList(context, payload) {
            Axios.get('/admin/order-list?page=' + payload)
                .then((result) => {
                    context.commit('orderList', result.data.orders)

                }).catch((err) => {

                });
        },
        order(context, payload) {
            Axios.get('/admin/order-detail/' + payload)
                .then((result) => {
                    context.commit('order', result.data.order)

                }).catch((err) => {

                });
        }

    },

    mutations: {
        orderList(state, payload) {
            return state.orderList = payload
        },
        order(state, payload) {
            return state.order = payload
        },

    }

}
