import * as types from '../mutation-types'

const state = {
    auth: ''
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

}

export default {
    state,
    getters,
    actions,
    mutations
}