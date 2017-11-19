import Vue from 'vue'
import Vuex from "vuex";

import payment from "./modules/payment";
import user from "./modules/user";
import alerts from "./modules/alerts";

Vue.use(Vuex);

export default new Vuex.Store({
  modules: {
    payment,
    user,
    alerts
  }
})
