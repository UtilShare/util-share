<template>
  <div class="create-expense">
    <form @submit.prevent="createExpense" class="form-control">
      <label for="expense_name">Expense name</label>
      <input id="expense_name" class="form-control" v-model="expense.name">

      <br>

      <label for="expense_name">Description</label>
      <input id="expense_name" class="form-control" v-model="expense.desc">

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
import { ADD_EXPENSES } from "../../store/mutation-types"
import ApiMixin from "../../mixins/Api";

export default {
  name: 'create-expense',
  mixins: [ApiMixin],
  data() {
    return {
      expense: {
        name: '',
        desc: '',
        owner_id: this.$store.state.user.id,
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
      this.sendRequest('expenses', 'POST', { expense: this.expense })
        .then(response => {
          this.$store.commit(ADD_EXPENSES, { expenses: [response.data] })
          this.$router.push('/expenses')
        })
        .catch(this.alertErrors)
    }
  }
}
</script>
