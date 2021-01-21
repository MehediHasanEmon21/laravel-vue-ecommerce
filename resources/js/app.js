

require('./bootstrap');

window.Vue = require('vue');

import router from './public/router.js'

import { store } from './common/store'

import library from './common/library'

import VueChatScroll from 'vue-chat-scroll';

Vue.use(VueChatScroll);


const app = new Vue({
    el: '#app',
    router,
    store,
    data: {
        test: 'This is testing for frontend'
    }
});
