<template>
    <div class="dashboard d-flex flex-column">
      <expenses-list></expenses-list>
      <payment-request-list></payment-request-list>
    </div>
</template>
<script>
import axios from "axios";
import ExpensesList from "../Expense/list"
import RequestsList from "../PaymentRequest/list"

export default {
  name: "dashboard",
  inject: ["api"],
  methods: {

  },
  components: {
    'expenses-list': ExpensesList,
    'payment-request-list': RequestsList
  }
};
</script>
