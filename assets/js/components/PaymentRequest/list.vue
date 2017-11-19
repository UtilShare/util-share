<template>
  <div class="list">
    <h2>Payment Requests</h2>
    <div class="d-flex flex-row" v-if="orderedRequests.length">
      <request-row v-for="request in orderedRequests" :key="request.id" :request="request"></request-row>
    </div>
    <p v-else class="text-muted">No payment requests</p>
  </div>
</template>
<script>
import _ from 'lodash';

import ApiMixin from "../../mixins/Api";
import RequestRow from './request-row'
import { ADD_REQUESTS } from "../../store/mutation-types"

export default {
  mixins: [ApiMixin],
  name: "payment-request-list",
  components: {
    'request-row': RequestRow
  },

  computed: {
    orderedRequests() {
      return _.orderBy(this.requests, (x)=>x.expense_instance.created_at)  
    },

    requests() {
      return this.$store.getters.requests
    }
  },

  mounted() {
    if (!this.$store.getters.requests || this.$store.getters.requests.length == 0) {
      this.sendRequest('payment_requests', "GET")
        .then(response => this.$store.commit(ADD_REQUESTS, { requests: response.data }))
        .catch(this.alertErrors)
    }
  }
}
</script>
