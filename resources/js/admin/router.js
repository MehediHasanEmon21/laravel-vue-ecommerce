
import Vue from 'vue'


import VueRouter from 'vue-router'


Vue.use(VueRouter)


Vue.component('admin-master', require('../components/admin/AdminMaster.vue').default)

import AdminDashboard from '../components/admin/AdminDashboard'
import AdminLogin from '../components/admin/auth/AdminLogin'

//category component import
import CategoryList from '../components/admin/category/CategoryList'


//brand component import
import BrandList from '../components/admin/brand/BrandList'


//product component import
import ProductList from '../components/admin/product/ProductList'
import AddOrUpdateProduct from '../components/admin/product/AddOrUpdateProduct'

//customer component import
import CustomerList from '../components/admin/customer/CustomerList'

//order component import
import OrderList from '../components/admin/order/OrderList'
import OrderDetail from '../components/admin/order/OrderDetail'








const router = new VueRouter({
    mode: 'history',
    linkActiveClass: 'active',
    routes: [
        {
            path: '/admin/dasboard',
            component: AdminDashboard,
            name: 'AdminDashboard'
        },
        {
            path: '/admin/login',
            component: AdminLogin,
            name: 'AdminLogin'
        },
        //category route
        {
            path: '/admin/categories',
            component: CategoryList,
            name: 'CategoryList'
        },

        //brand route
        {
            path: '/admin/brands',
            component: BrandList,
            name: 'BrandList'
        },

        //product route
        {
            path: '/admin/products',
            component: ProductList,
            name: 'ProductList'
        },
        {
            path: '/admin/add-products',
            component: AddOrUpdateProduct,
            name: 'AddOrUpdateProduct'
        },

        {
            path: '/admin/edit-product/:id',
            component: AddOrUpdateProduct,
            name: 'EditProduct'
        },

        //customer route
        {
            path: '/admin/customers',
            component: CustomerList,
            name: 'CustomerList'
        },

        //order route
        {
            path: '/admin/orders',
            component: OrderList,
            name: 'OrderList'
        },
        {
            path: '/admin/order-details/:order_id',
            component: OrderDetail,
            name: 'OrderDetail'
        },
    ]
})

router.beforeEach((to, from, next) => {

    let isAuthenticated = '';
    let authUser = localStorage.getItem('AdminLoggedIn') ? JSON.parse(localStorage.getItem('AdminLoggedIn')) : false
    if (authUser) {

        isAuthenticated = authUser.id && authUser.email ? true : false;

    } else {
        isAuthenticated = false;
    }

    if (to.name !== 'AdminLogin' && !isAuthenticated) next({ name: 'AdminLogin' })
    else if (to.name === 'AdminLogin' && isAuthenticated) next({ name: 'AdminDashboard' })
    else next()
})

export default router;
