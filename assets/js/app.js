import "phoenix_html"
import App from "./components/app.vue"
import Foo from "./components/foo.vue"
import Bar from "./components/bar.vue"



Vue.use(VueRouter)

const routes = [
  { path: '/foo', component: Foo },
  { path: '/bar', component: Bar }
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
