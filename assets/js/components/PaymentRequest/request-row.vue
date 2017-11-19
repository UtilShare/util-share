<template>
  <div v-if="!completed" class="card request">
    <div class="card-body">
      <div class="row">
        <div class="col-md-3">
          <h4 class="card-title">{{request.expense_instance.expense.name}}</h4>
        </div>
        <div class="col-md-5">
          <h6 class="card-subtitle mb-2 text-muted">{{request.expense_instance.expense.household.name}}</h6>
          <h6 class="card-subtitle mb-2 text-muted">to: {{request.expense_instance.expense.owner.first}} {{request.expense_instance.expense.owner.last}}</h6>
        </div>
        <div class="col-md-4">
          <button @click="payExpense" class="btn btn-success">Pay ${{amount | twoPlaces}}</button>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import ApiMixin from "../../mixins/Api";
import { ADD_ALERT } from "../../store/mutation-types";
export default {
  mixins: [ApiMixin],
  name: "payment-request-row",
  props: ["request"],
  data: function(){
    return {
      paid: false,
      completed: this.request.paid_at || this.paid
    }
  },
  methods: {
    payExpense() {
      this.sendRequest("payment_requests", "POST", { id: this.request.id })
        .then(response => {
          this.$store.commit(ADD_ALERT, {
                alert: {
                  message: "All Paid",
                  type: "info"
                }
              });
          this.paid = true;
        })
        .catch(this.alertErrors);
    }
  },
  filters: {
    twoPlaces(value) {
      return value.toFixed(2);
    }
  },

  computed: {
    amount() {
      return (
        this.request.expense_instance.amount * (this.request.percent / 100)
      );
    }
  }
};
</script>
