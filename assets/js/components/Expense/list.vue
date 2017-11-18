<template>
  <div class="expenses-container">
    <h3>Expenses</h3> 
    <router-link to="expenses/new" class="btn btn-secondary">Create New Expense</router-link>
    <br><br>
    <div class="expense-list" v-if="expenses.length">
      <expense :key="expense.id" :expense="expense" v-for="expense in expenses"/>
    </div>
    <p v-else class="text-muted">No expenses owned by you</p>
  </div>
</template>

<script>
import Vuex from 'vuex'

import ApiMixin from "../../mixins/Api"
import Expense from './expense'
import { ADD_EXPENSES } from "../../store/mutation-types"

export default {
  name: 'expense-list',
  components: {
    'expense': Expense
  },
  mixins: [ApiMixin],

  computed: Vuex.mapState({
    expenses: state => state.expenses
  }),

  mounted() {
    if (!this.$store.state.expenses || this.$store.state.expenses.length == 0) {
      this.sendRequest('expenses', 'GET')
        .then(response => this.$store.commit(ADD_EXPENSES, { expenses: response.data }))
        .catch(this.alertErrors)
    }
  }
}
</script>
