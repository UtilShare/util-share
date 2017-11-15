// import "phoenix_html"

import Vue from 'vue'
import VueRouter from 'vue-router'
import App from './components/app.vue'
import Register from './components/User/register'
import Login from './components/User/login'
import axios from 'axios';
import store from "./store";

Vue.use(VueRouter);
Vue.use(Vuex);

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
