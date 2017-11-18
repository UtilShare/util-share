<template>
  <div class="d-flex flex-row m-1">
      <div class="card">
        <div class="card-body">
            <h4 class="card-title">{{request.expense_instance.expense.name}}</h4>
            <h6 class="card-subtitle mb-2 text-muted">{{request.expense_instance.expense.household.name}}</h6>
            <h6 class="card-subtitle mb-2 text-muted">to: {{request.expense_instance.expense.owner.first}} {{request.expense_instance.expense.owner.last}}</h6>
            <button class="btn btn-success">Pay ${{amount | twoPlaces}}</button>
        </div>
      </div>
  </div>
</template>
<script>
import ApiMixin from "../../mixins/Api";
export default {
  mixins: [ApiMixin],
  name: "payment-request-row",
  props: ["request"],
  filters: {
    twoPlaces(value) {
      return value.toFixed(2);
    }
  },
  computed: {
    amount() {
      return this.request.expense_instance.amount * (this.request.percent/100);
    },
  },
  mounted: function() {
    
  }
};
</script>
