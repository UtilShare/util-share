<template>
    <div class="login">
        <label>Email:</label>
        <input v-model="email"/>
        <button @click.prevent="login">Login</button>
    </div>
</template>
<script>
import axios from "axios";
import { SET_AUTH } from "../../store/mutation-types";
export default {
  name: "login",
  inject: ["api"],
  methods: {
    login: function() {
      axios
        .post(`${this.api}/sessions`, { login: { email: this.email } })
        .then(response => {
          this.$store.commit(SET_AUTH, { auth: response.data.jwt });
        })
        .catch(reason => console.log(reason));
    }
  }
};
</script>