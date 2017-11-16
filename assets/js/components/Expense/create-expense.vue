<template>
  <div class="create-expense">
    <form @submit.prevent="createExpense" class="form-control">
      <label for="expense_name">Expense Name</label>
      <input class="form-control" v-model="expense.name">
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
        owner: this.$store.user.households,
        household_id: null
      }
    }
  }
}
</script>
