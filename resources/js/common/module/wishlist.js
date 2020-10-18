import Axios from "axios"

export const wishlist = {
    namespaced: true,
    state: {
        wishlist: {}
    },

    getters: {
        WishList(state) {
            return state.wishlist
        },

    },

    actions: {
        WishList(context, payload) {
            Axios.get('/user/wishlist?page=' + payload)
                .then((result) => {
                    console.log(result)
                    context.commit('WishList', result.data.wishlist)
                }).catch((err) => {

                });

        },
        // deleteBrand(context, payload) {
        //     Axios.delete('/admin/brand/' + payload.id)
        //         .then((result) => {
        //             context.commit('wishList', result.data.brands)
        //         })
        // },
        // allBrand(context) {
        //     Axios.get('/admin/all-brand')
        //         .then((result) => {
        //             context.commit('allBrand', result.data.brands)
        //         }).catch((err) => {

        //         });
        // }

    },

    mutations: {
        WishList(state, payload) {
            return state.wishlist = payload
        },

    }

}
