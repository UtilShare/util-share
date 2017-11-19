<template>
  <div>
    <div id="iavContainer"></div>
  </div>
</template>
<script>
import ApiMixin from "../../mixins/Api";
import { ADD_ALERT, SET_USER } from "../../store/mutation-types"
export default {
  name: "create-funding-source",
  mixins: [ApiMixin],
  data() {
    return {};
  },
  mounted() {
    if(this.$store.state.user.bank_id){
      return this.$router.push("/dashboard");
    }
    this.sendRequest("funding_sources", "GET").then(x => {
      this.handleDwolla(x.data.token);
    });
  },
  methods: {
    handleDwolla(token) {
      dwolla.configure("sandbox");
      dwolla.iav.start(
        token,
        {
          container: "iavContainer",
          microDeposits: false,
          fallbackToMicroDeposits: false
        },
        (err, res) => {
          if (err) {
            this.alertErrors;
            return;
          } else {
            this.sendRequest("funding_sources", "POST").then((resp) => {
              this.$store.commit(SET_USER, { user: resp.data });
              this.$store.commit(ADD_ALERT, {
                alert: {
                  message: "Source Added",
                  type: "info"
                }
              });
              this.$router.push("/dashboard");
            });
          }
        }
      );
    }
  }
};
</script>
