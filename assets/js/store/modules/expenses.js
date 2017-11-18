import _ from 'lodash'

import * as types from '../mutation-types'

const state = []

const getters = {}

const actions = {}

const mutations = {
  [types.ADD_EXPENSE_INSTANCE](state, { expense, instance }) {
    expense.instances = [instance, ...expense.instances]
    state.expenses = _.map(state.expenses, (e) => {
      if (e.id === expense.id) return expense
      return e
    })
  },

  [types.ADD_EXPENSES](state, {expenses}) {
    expenses.forEach(e => state.push(e))
  },

  [types.LOGOUT](state, opts={}) {
    state.splice(0, state.length)
  }
}

export default {
  state,
  getters,
  actions,
  mutations
}
