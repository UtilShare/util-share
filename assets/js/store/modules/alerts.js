import * as types from '../mutation-types'

const state = []

const getters = {}

const actions = {}

const mutations = {
  [types.ADD_ALERT](state, { alert }) {
    state.push(alert)

    if (alert.duration) {
      setTimeout(duration * 1000, () => {
        index = state.alerts.indexOf(alert)
        _.pullAt(state.alerts, [index])
      })
    }
  }
}

export default {
  state,
  getters,
  actions,
  mutations
}
