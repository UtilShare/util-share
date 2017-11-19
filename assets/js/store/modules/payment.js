import _ from 'lodash'

import * as types from '../mutation-types'

const state = {
  expenses: [],
  requests: []
}

const getters = {
  expenses: state => state.expenses,
  requests: state => state.requests
}

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
    state.expenses = [...expenses, ...state.expenses]
  },

  [types.ADD_REQUESTS](state, {requests}) {
    state.requests = [...requests, ...state.requests]
  },

  [types.LOGOUT](state, opts={}) {
    state.expenses = []
    state.requests = []
  }
}

export default {
  state,
  getters,
  actions,
  mutations
}
