<template>
  <div>
    <div v-if="alertText" class="alert alert-primary" role="alert">
      {{alertText}}
    </div>
    <div class="modal-header">  
      <h2 v-if="!register" class="modal-title">Login</h2>
      <h2 v-if="register" class="modal-title">Register</h2>
    </div>
    <div v-if="!register" class="modal-body">
      <login v-bind:email="preloadEmail" v-on:logged-in="loggedIn"></login>
      <button class="btn btn-link" @click="register = true">Need to Register?</button>
    </div>
    <div v-if="register" class="modal-body">
      <register v-on:registered="registered"></register>
      <button class="btn btn-link" @click="register = false">Already have an Account?</button>
    </div>
  </div>
</template>
<script>
import Register from "./register";
import Login from "./login";
export default {
  name: "landing",
  data: () => {
    return {
      register: false,
      alertText: "",
      preloadEmail: ""
    };
  },
  methods: {
    registered: function(model) {
      this.preloadEmail = model.email;
      this.alertText = "Account Created!"
      this.register = false;
    },
    loggedIn: function() {
      this.$router.push('/dashboard');
      //Redirect to the dashboard
    }
  },
  components: {
    register: Register,
    login: Login
  }
};
</script>