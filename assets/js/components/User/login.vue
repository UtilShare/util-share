<template>
    <div class="login">
      <form class="form-control" @submit.prevent="login">
        <label for="email">Email:</label>
        <input class="form-control" id="email" v-model="login.email"/>

        <label for="password">Password:</label>
        <input class="form-control" type="password" id="password" v-model="password"/>
        <input type="submit" value="Sign in" class="btn btn-primary mt-2">
      </form>
    </div>
</template>
<script>
import axios from "axios";
import { SET_AUTH, SET_USER } from "../../store/mutation-types";

export default {
  name: "login",
  inject: ["api"],
  props: ['email'],

  data() {
    return {
      login: { email: this.email }
    }
  },

  methods: {
    login() {
      axios
        .post(`${this.api}/sessions`, { login: this.login })
        .then(response => {
          this.$store.commit(SET_AUTH, { auth: response.data.jwt });
          this.$store.commit(SET_USER, { user: response.data.user })
          this.$emit('logged-in');
        })
        .catch(reason => console.log(reason));
    }
  }
};
</script>
