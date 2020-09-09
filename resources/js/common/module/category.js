import Axios from "axios"
import { result } from "lodash";

export const category = {
    namespaced: true,
    state: {
        categories: {}
    },

    getters: {
        categoryList(state) {
            return state.categories
        },
        allCategory(state) {
            return state.categories
        }
    },

    actions: {
        categoryList(context, payload) {
            Axios.get('/admin/category?page=' + payload)
                .then((result) => {
                    context.commit('categoryList', result.data.categories)
                }).catch((err) => {

                });

        },
        deleteCategory(context, payload) {
            Axios.delete('/admin/category/' + payload.id)
                .then((result) => {
                    context.commit('categoryList', result.data.categories)
                })
        },
        allCategory(context) {
            axios.get('/admin/all-category')
                .then((result) => {
                    context.commit('allCategory', result.data.categories)
                })
        }
    },

    mutations: {
        categoryList(state, payload) {
            return state.categories = payload
        },
        allCategory(state, payload) {
            return state.categories = payload
        }
    }

}
