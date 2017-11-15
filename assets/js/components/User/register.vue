<template>
    <div class="register">
      <form @submit.prevent="createUser" class="form-control">
        <label for="email">Email:</label>
        <input id="email" v-model="email" class="form-control"/>

        <label for="first">First Name:</label>
        <input id="first" v-model="first" class="form-control"/>

        <label for="last">Last Name:</label>
        <input id="last" v-model="last" class="form-control"/>

        <input type="submit" value="Register" class="btn btn-primary">
      </form>
    </div>
</template>
<script>
import axios from "axios";

export default {
  name: "register",
  inject: ["api"],
  methods: {
    createUser: function() {
      axios
        .post(`${this.api}/users`, {user:{first:this.first, last:this.last, email: this.email}})
        .then(response => {
          console.log(response.data);
        })
        .catch(reason => console.log(reason));
    }
  }
};
</script>
