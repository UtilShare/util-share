import "phoenix_html"

import Vue from 'vue'
import VueRouter from 'vue-router'
import App from "./components/app.vue"
import Foo from "./components/foo.vue"
import Bar from "./components/bar.vue"
import Register from "./components/User/register"

Vue.use(VueRouter)

const routes = [
  { path: '/foo', component: Foo },
  { path: '/bar', component: Bar },
  { path: 'user/register', component: Register }
]

const router = new VueRouter({
  routes
})

window.vms = new Vue({
  router,
  components: {
    'app': App
  }
}).$mount('#app')
