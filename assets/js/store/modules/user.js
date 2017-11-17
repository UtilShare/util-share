import * as types from '../mutation-types'

const state = {
    auth: '',
    first: '',
    last: '',
    email: '',
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
        state.auth = auth
    },

}

export default {
    state,
    getters,
    actions,
    mutations
}