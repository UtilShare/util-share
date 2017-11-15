// import "phoenix_html"

import Vue from 'vue'
import Vuex from 'vuex';
import VueRouter from 'vue-router'
import App from './components/app.vue'
import Register from './components/User/register'
import Login from './components/User/login'
import store from './store';
import axios from 'axios';
import types from './store/mutation-types';

Vue.use(VueRouter);


const routes = [
  { path: '/user/register', component: Register },
  { path: '/user/login', component: Login }
]

const router = new VueRouter({
  routes
})
let config = {
  api: 'http://localhost:4000/api'
}

window.vms = new Vue({
  router,
  store,
  provide: config,
  components: {
    'app': App
  }
}).$mount('#app')
