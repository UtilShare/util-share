import user from "./modules/user";
import user from "./modules/expenses";
import Vue from 'vue'
import Vuex from "vuex";

Vue.use(Vuex);

export default new Vuex.Store({
  modules: {
    expenses,
    user
  }
})
