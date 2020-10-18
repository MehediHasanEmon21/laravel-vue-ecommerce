
import Vue from 'vue'


import VueRouter from 'vue-router'


Vue.use(VueRouter)


Vue.component('public-master', require('../components/public/PublicMaster.vue').default)





import HomeComponent from '../components/public/Home.vue'
import ShopComponent from '../components/public/shop/Shop.vue'
import CartComponent from '../components/public/shop/Cart.vue'
import CheckoutComponent from '../components/public/shop/Checkout.vue'
import AboutComponent from '../components/public/shop/About.vue'
import ContactComponent from '../components/public/shop/Contact.vue'
import BlogComponent from '../components/public/shop/Blog.vue'
import WishListComponent from '../components/public/shop/WishList.vue'


//import auth component
import UserLogin from '../components/public/auth/UserLogin'
import UserRegister from '../components/public/auth/UserRegister'
import UserDashboard from '../components/public/user/UserDashboard'


const router = new VueRouter({
    mode: 'history',
    routes: [
        {
            path: '/',
            component: HomeComponent,
            name: 'Home'
        },
        {
            path: '/shop',
            component: ShopComponent,
            name: 'Shop'
        },
        {
            path: '/cart',
            component: CartComponent,
            name: 'Cart'
        },
        {
            path: '/checkout',
            component: CheckoutComponent,
            name: 'Checkout'
        },
        {
            path: '/about',
            component: AboutComponent,
            name: 'About'
        },
        {
            path: '/contact',
            component: ContactComponent,
            name: 'Contact'
        },
        {
            path: '/blog',
            component: BlogComponent,
            name: 'Blog'
        },
        {
            path: '/wishlist',
            component: WishListComponent,
            name: 'WishList',
            beforeEnter: (to, from, next) => {
                const isAuthenticated = localStorage.getItem('userLoggedIn') ? true : false
                if (to.name !== 'UserLogin' && !isAuthenticated) next({ name: 'UserLogin' })
                else next()
            }
        },
        //auth route
        {
            path: '/user-login',
            component: UserLogin,
            name: 'UserLogin',
            beforeEnter: (to, from, next) => {
                const isAuthenticated = localStorage.getItem('userLoggedIn') ? true : false
                if (to.name == 'UserLogin' && isAuthenticated) next({ name: 'UserDashboard' })
                else next()
            }
        },
        {
            path: '/user-register',
            component: UserRegister,
            name: 'UserRegister'
        },

        {
            path: '/user/user-dashboard',
            component: UserDashboard,
            name: 'UserDashboard',
            beforeEnter: (to, from, next) => {
                const isAuthenticated = localStorage.getItem('userLoggedIn') ? true : false
                if (to.name !== 'UserLogin' && !isAuthenticated) next({ name: 'UserLogin' })
                else next()
            }
        },
    ]
})

export default router;
