<template>
  <div class="expenses-container">
    <h3>Expenses</h3> 
    <router-link to="expenses/new" class="btn btn-link">Create New Expense</router-link>
    <div class="expense-list">
      <expense :key="expense.id" :expense="expense" v-for="expense in expenses"/>
    </div>
  </div>
</template>

<script>
import Vuex from 'vuex'
import Expense from './expense'

export default {
  name: 'expense-list',
  components: {
    'expense': Expense
  },

  computed: Vuex.mapState({
    expenses: state => state.expenses
  })
}
</script>
