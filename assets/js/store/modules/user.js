import _ from 'lodash'
import Vue from 'vue'
import * as types from '../mutation-types'

let initialState = {
  auth: '',
  first: '',
  last: '',
  email: '',
  households: []
}

const state = Vue.util.extend({}, initialState)
// getters
const getters = {
  auth: state => state.auth
}

// actions
const actions = {
}

// mutations
const mutations = {
  [types.SET_AUTH](state, { auth }) {
      state.auth = auth
  },

  [types.SET_USER](state, { user }) {
    state = _.merge(state, user)
  },

  [types.ADD_HOUSEHOLD](state, { household }) {
    state.households.push(household)
  },

  [types.LOGOUT](state, opts={}) {
    state.households = []
    for (let f in state) {
      Vue.set(state, f, initialState[f])
    }
  }
}

export default {
  state,
  getters,
  actions,
  mutations
}
