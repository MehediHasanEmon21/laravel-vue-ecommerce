import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

import { user } from './module/user'
import { admin } from './module/admin'
import { category } from './module/category'
import { brand } from './module/brand'
import { product } from './module/product'
import { wishlist } from './module/wishlist'
import { cart } from './module/cart'

export const store = new Vuex.Store({
    modules: {
        user: user,
        admin: admin,
        category: category,
        brand: brand,
        product: product,
        wishlist: wishlist,
        cart: cart,
    }
})
