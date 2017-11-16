<template>
    <div class="login">
        <label>Email:</label>
        <input v-model="email"/>
        <button @click.prevent="login">Login</button>
        <label>AuthToken:</label>
        <label>{{token}}</label>
    </div>
</template>
<script>
import axios from "axios";
import { SET_AUTH, SET_USER } from "../../store/mutation-types";

export default {
  name: "login",
  inject: ["api"],
  computed: {
    token() {
      return this.$store.getters.auth;
    }
  },
  methods: {
    login: function() {
      axios
        .post(`${this.api}/sessions`, { login: { email: this.email } })
        .then(response => {
          this.$store.commit(SET_AUTH, { auth: response.data.jwt });
          this.$store.commit(SET_USER, { user: response.data.user })
        })
        .catch(reason => console.log(reason));
    }
  }
};
</script>
