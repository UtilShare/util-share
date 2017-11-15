// import "phoenix_html"

import Vue from 'vue'
import Vuex from 'vuex';
import VueRouter from 'vue-router'
<<<<<<< HEAD
import axios from 'axios';
=======
import Vuex from 'vuex'
>>>>>>> Set up vuex

import App from './components/app.vue'
import Register from './components/User/register'
import Login from './components/User/login'
import CreateHousehold from "./components/Household/create-household";
import store from './store';
import ExpenseList from './components/Expense/list'
import types from './store/mutation-types';

Vue.use(VueRouter);

Vue.use(VueRouter)

const routes = [
  { path: '/user/register', component: Register },
  { path: '/user/login', component: Login },
  { path: '/household/create', component: CreateHousehold },
  { path: '/expenses', component: ExpenseList }
]

const router = new VueRouter({
  routes
})

// dummy expense data
const expenses = [
  {
    name: 'WiFi',
    household: {
      id: 1,
      name: 'South End Apartment',
      users: [
        { name: 'John Doe', id: 1 },
        { name: 'Svetomir Eliora', id: 2 },
        { name: 'Felix Derick', id: 3 },
        { name: 'Sheard Rozaliya', id: 4 }
      ]
    },
    owner: {
      name: 'John Doe',
      id: 1
    }
  }
]

const store = new Vuex.Store({
  state: {
    expenses
  }
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
