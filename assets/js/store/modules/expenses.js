import _ from 'lodash'

import * as types from '../mutation-types'

const state = [
  {
    id: 1,
    name: 'WiFi',
    household: {
      id: 1,
      name: 'South End Apartment',
      users: [
        { name: 'John Doe', id: 1 },
        { name: 'Svetomir Eliora', id: 2 },
        { name: 'Felix Derick', id: 3 },
        { name: 'Sheard Rozaliya', id: 4 }
      ]
    },
    owner: {
      name: 'John Doe',
      id: 1
    },
    instances: []
  }
]

const getters = {}
const actions = {}
const mutations = {
  [types.ADD_EXPENSE_INSTANCE](state, { expense, instance }) {
    expense.instances = expense.instances.concat(instance)
    state.expenses = _.map(state.expenses, (e) => {
      if (e.id === expense.id) return expense
      return e
    })
  }
}

export default {
  state,
  getters,
  actions,
  mutations
}
