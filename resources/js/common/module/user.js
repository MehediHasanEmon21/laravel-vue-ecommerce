import Axios from "axios"

export const user = {
    namespaced: true,
    state: {
        user: {},
        userList: {},
        searchUsers: {},
    },

    getters: {
        getUser(state) {
            return state.user
        },
        userList(state) {
            return state.userList
        },
        searchUsers(state) {
            return state.searchUsers
        }
    },

    actions: {

        getUser(context, payload) {
            let userLogin = localStorage.getItem('userLoggedIn')
            if (userLogin) {

                Axios.get('/user')
                .then((result) => {
                    context.commit('getUser', result.data.user)
                }).catch((err) => {

                });

            } else {
                 context.commit('getUser', {user: ''})
            }


        },
        userList(context, payload) {
            Axios.get('/admin/user-list?page=' + payload)
                .then((result) => {
                    context.commit('userList', result.data.user_list)

                }).catch((err) => {

                });
        },
        searchUser(context, payload) {
            Axios.get('/admin/search-user/' + payload.query + '?page=' + payload.currentPage)
                .then((result) => {

                    context.commit('searchUsers', result.data.search_users)

                }).catch((err) => {

                });
        },
        userLogout(context) {
            Axios.post('/logout')
                .then((result) => {
                    context.commit('getUser', result.data)
                })
        }
    },

    mutations: {
        getUser(state, payload) {
            return state.user = payload
        },
        userList(state, payload) {
            return state.userList = payload
        },
        searchUsers(state, payload) {
            return state.searchUsers = payload
        }
    }

}
