<template>
    <div class="register">
      <form @submit.prevent="createUser" class="form-control">
        <label for="email">Email:</label>
        <input id="email" v-model.trim="email" class="form-control"/>

        <label for="first">First Name:</label>
        <input id="first" v-model.trim="first" class="form-control"/>

        <label for="last">Last Name:</label>
        <input id="last" v-model.trim="last" class="form-control"/>

        <label for="address">Address:</label>
        <input id="address" v-model.trim="address" class="form-control"/>

        <label for="city">City:</label>
        <input id="city" v-model.trim="city" class="form-control"/>

        <label for="state">State:</label>
        <input id="state" v-model.trim="state" class="form-control"/>

        <label for="zip">Zip:</label>
        <input id="zip" v-model.trim="zip" class="form-control"/>

        <label for="dob">Date of Birth:</label>
        <input id="dob" placeholder="YYYY-MM-DD" v-model.trim="dob" class="form-control"/>

        <label for="ssn">SSN (last 4 only):</label>
        <input id="ssn" type="password" v-model.trim="ssn" maxlength="4" class="form-control"/>

        <input type="submit" value="Register" class="btn btn-primary mt-2">
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
      let model = {
        user: {
          first: this.first,
          last: this.last,
          email: this.email,
          address: this.address,
          city: this.city,
          state: this.state,
          zip: this.zip,
          dob: this.dob,
          ssn: this.ssn,
          ip: "10.10.10.10"
        }
      };
      this.sendRequest('users', POST, model)
        .then(response => {
          console.log(response.data);
          this.$emit("registered", { email: this.email });
        })
    }
  }
};
</script>
