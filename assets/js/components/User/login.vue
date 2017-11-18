<template>
    <div class="login">
      <form class="form-control" @submit.prevent="submitLogin">
        <label for="email">Email:</label>
        <input class="form-control" id="email" v-model="login.email"/>

        <label for="password">Password:</label>
        <input class="form-control" type="password" id="password" v-model="login.password"/>
        <input type="submit" value="Sign in" class="btn btn-primary mt-2">
      </form>
    </div>
</template>

<script>
import axios from "axios";

import ApiMixin from "../../mixins/Api"
import { SET_AUTH, SET_USER, ADD_ALERT } from "../../store/mutation-types";

export default {
  name: "login",
  props: ['email'],
  mixins: [ApiMixin],

  data() {
    return {
      login: { email: this.email, password: this.password }
    }
  },

  methods: {
    submitLogin() {
      this.sendRequest('sessions', 'POST', { login: this.login })
        .then(response => {
          this.$store.commit(SET_AUTH, { auth: response.data.jwt });
          this.$store.commit(SET_USER, { user: response.data.user })
          this.$emit('logged-in');
        })
        .catch(this.alertErrors)
    }
  }
};
</script>
