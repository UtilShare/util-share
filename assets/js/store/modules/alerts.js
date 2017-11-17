import _ from 'lodash'
import * as types from '../mutation-types'

const state = []

const getters = {}

const actions = {}

const mutations = {
  [types.ADD_ALERT](state, { alert }) {
    alert['id'] = Date.now()
    state.push(alert)
  }
}

export default {
  state,
  getters,
  actions,
  mutations
}
