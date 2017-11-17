<template>
  <div class="create-expense">
    <form @submit.prevent="createExpense" class="form-control">
      <label for="expense_name">Expense name</label>
      <input id="expense_name" class="form-control" v-model="expense.name">

      <br>

      <label for="expense_household_id">Household</label>
      <select class="form-control" v-model="expense.household_id">
        <option v-for="household in households" :value="household.id">
          {{household.name}}
        </option>
      </select>

      <br>
      <input type="submit" class="btn btn-primary" value="Create Expense"/>
    </form>
  </div>
</template>

<script>
export default {
  name: 'create-expense',
  data() {
    return {
      expense: {
        name: '',
        owner_id: 1,
        household_id: null
      }
    }
  },

  computed: {
    households() {
      return this.$store.state.user.households
    }
  },

  methods: {
    createExpense() {
      sendRequest('expenses', 'POST', this.expense)
        .then(response => console.log(response))
        .catch(reason => console.log(reason))
    }
  }
}
</script>
