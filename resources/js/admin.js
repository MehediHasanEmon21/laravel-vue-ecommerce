

require('./bootstrap');

window.Vue = require('vue');

import router from './admin/router.js'

// Vue.component('example-component', require('./components/ExampleComponent.vue').default);

import { store } from './common/store'
import library from './common/library'


const admin = new Vue({
    el: '#admin',
    router,
    store
});
