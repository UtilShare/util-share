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
    instances: [{
      id: 1,
      complete: false,
      amount: 250,
      splits: [
        { user: { name: 'Svetomir Eliora', id: 2 }, complete: false, percent: 25 },
        { user: { name: 'Felix Derick', id: 3 }, complete: true, percent: 25 },
        { user: { name: 'Sheard Rozaliya', id: 4 }, complete: true, percent: 25 },
      ]
    }, {
      id: 2,
      complete: true,
      amount: 500,
      splits: [
        { user: { name: 'Svetomir Eliora', id: 2 }, complete: true, percent: 25 },
        { user: { name: 'Felix Derick', id: 3 }, complete: true, percent: 25 },
        { user: { name: 'Sheard Rozaliya', id: 4 }, complete: true, percent: 25 },
      ]
    }]
  },
  {
    id: 2,
    name: 'Electricity',
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
      name: 'Svetomir Eliora',
      id: 2
    },
    instances: []
  }
]

const getters = {}
const actions = {}
const mutations = {
  [types.ADD_EXPENSE_INSTANCE](state, { expense, instance }) {
    expense.instances = [instance, ...expense.instances]
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
