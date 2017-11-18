import Vue from 'vue'
import Vuex from "vuex";

import expenses from "./modules/expenses";
import user from "./modules/user";
import alerts from "./modules/alerts";

Vue.use(Vuex);

export default new Vuex.Store({
  modules: {
    expenses,
    user,
    alerts
  }
})
