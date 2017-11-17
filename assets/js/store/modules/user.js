import _ from 'lodash';
import * as types from '../mutation-types'

const state = {
    auth: '',
    first: '',
    last: '',
    email: '',
    households: []
}

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
        debugger;
        state.auth = auth
    },

  [types.SET_USER](state, { user }) {
    state = _.merge(state, user)
  }
}

export default {
    state,
    getters,
    actions,
    mutations
}
