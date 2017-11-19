<template>
    <div class="dashboard row">
      <div class="col-md-6">
        <expenses-list></expenses-list>
      </div>
      <div class="col-md-6">
        <payment-request-list></payment-request-list>
      </div>
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
