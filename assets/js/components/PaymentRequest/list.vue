<template>
  <div class="list">
    <h2>Payment Requests</h2>
    <div class="d-flex flex-row">
      <request-row v-for="request in orderedRequests" :key="request.id" :request="request"></request-row>
    </div>
  </div>
</template>
<script>
import ApiMixin from "../../mixins/Api";
import RequestRow from './request-row'
import _ from 'lodash';
export default {
  mixins: [ApiMixin],
  name: "payment-request-list",
  data: function(){
    return {
      requests : []
    };
  },
  computed: {
    orderedRequests() {
      return _.orderBy(this.requests, (x)=>x.expense_instance.created_at)  
    }
  },
  components:{
    'request-row': RequestRow
  },
  mounted: function() {
    this.sendRequest(`payment_requests`, "GET").then(x=>{
      this.requests = x.data;
    });
  }
};
</script>
