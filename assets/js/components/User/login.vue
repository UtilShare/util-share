<template>
    <div class="login">
      <form class="form-control" @submit.prevent="submitLogin">
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
import { SET_AUTH, SET_USER, ADD_ALERT } from "../../store/mutation-types";

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
    submitLogin() {
      axios
        .post(`${this.api}/sessions`, { login: this.login })
        .then(response => {
          this.$store.commit(SET_AUTH, { auth: response.data.jwt });
          this.$store.commit(SET_USER, { user: response.data.user })
          this.$emit('logged-in');
        })
        .catch(reason => {
          if (reason.response.data.error) {
            this.$store.commit(ADD_ALERT, { alert: {
              message: reason.response.data.error,
              type: 'danger'
            }})
          } else if (reason.response.data.errors) {
            reason.response.errors.forEach(error => {
              this.$store.commit(ADD_ALERT, { alert: {
                message: reason.response.data.error,
                type: 'danger'
              }})
            })
          }
        });
    }
  }
};
</script>
