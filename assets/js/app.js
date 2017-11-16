// import "phoenix_html"

import Vue from 'vue';
import VueRouter from 'vue-router';
import axios from 'axios';

import App from './components/app.vue';
import Register from './components/User/register';
import Login from './components/User/login';
import Landing from './components/User/landing';
import Dashboard from './components/Dashboard/dashboard';
import CreateHousehold from "./components/Household/create-household";
import ExpenseList from './components/Expense/list';
import CreateExpense from './components/Expense/create-expense';
import store from './store';

Vue.use(VueRouter);

const routes = [
  { path: '/user/landing', component: Landing, },
  { path: '/household/create', component: CreateHousehold },
  { path: '/expenses', component: ExpenseList },
  { path: '/dashboard', component: Dashboard },
  { path: '/expenses/new', component: CreateExpense }
];

const router = new VueRouter({
  routes
});


let config = {
  api: 'http://localhost:4000/api'
};

window.vms = new Vue({
  router,
  store,
  provide: config,
  components: {
    'app': App,
  }
}).$mount('#app');
