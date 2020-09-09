import Axios from "axios"

export const admin = {
    namespaced: true,
    state: {
        admin: {}
    },

    getters: {
        getUser(state) {
            return state.admin
        }
    },

    actions: {
        getUser(context, payload) {
            Axios.get('/admin/user')
                .then((result) => {
                    context.commit('getUser', result.data.admin)
                }).catch((err) => {

                });

        },
    },

    mutations: {
        getUser(state, payload) {
            return state.admin = payload
        }
    }

}
