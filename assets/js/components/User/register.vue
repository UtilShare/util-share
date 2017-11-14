<template>
    <div class="register">
        <label>Email:</label>
        <input v-model="email"/>
        <label>First:</label>
        <input v-model="first"/>
        <label>Last:</label>
        <input v-model="last"/>
        <button v-on:click="createUser">Register</button>
    </div>
</template>
<script>
import axios from "axios";
console.log("here");

export default {
  name: "register",
  inject: ["api"],
  methods: {
    createUser: function() {
      axios
        .post(this.api+'/users', {user:{first:this.first, last:this.last, email: this.email}})
        .then(response => {
          console.log(response.data);
        })
        .catch(reason => console.log(reason));
    }
  }
};
</script>
