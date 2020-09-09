import Axios from "axios"

export const brand = {
    namespaced: true,
    state: {
        brands: {}
    },

    getters: {
        brandList(state) {
            return state.brands
        },
        allBrand(state) {
            return state.brands
        }
    },

    actions: {
        brandList(context, payload) {
            Axios.get('/admin/brand?page=' + payload)
                .then((result) => {
                    context.commit('brandList', result.data.brands)
                }).catch((err) => {

                });

        },
        deleteBrand(context, payload) {
            Axios.delete('/admin/brand/' + payload.id)
                .then((result) => {
                    context.commit('brandList', result.data.brands)
                })
        },
        allBrand(context) {
            Axios.get('/admin/all-brand')
                .then((result) => {
                    context.commit('allBrand', result.data.brands)
                }).catch((err) => {

                });
        }
    },

    mutations: {
        brandList(state, payload) {
            return state.brands = payload
        },
        allBrand(state, payload) {
            return state.brands = payload
        }
    }

}
