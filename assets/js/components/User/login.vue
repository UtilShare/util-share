<template>
    <div class="login">
        <label>Email:</label>
        <input v-model="email"/>
        <button @click.prevent="login">Login</button>
    </div>
</template>
<script>
import axios from "axios";
import types from "../../store/mutation-types";
export default {
  name: "login",
  inject: ["api"],
  methods: {
    login: function() {
      axios
        .post(`${this.api}/sessions`, { login: { email: this.email } })
        .then(response => {
          this.$store.dispatch(types.SET_AUTH, products)
          console.log(response.data);
        })
        .catch(reason => console.log(reason));
    }
  }
};
</script>