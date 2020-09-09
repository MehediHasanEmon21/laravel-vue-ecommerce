

require('./bootstrap');

window.Vue = require('vue');

import router from './public/router.js'

import { store } from './common/store'

import library from './common/library'


const app = new Vue({
    el: '#app',
    router,
    store,
    data: {
        test: 'This is testing for frontend'
    }
});
