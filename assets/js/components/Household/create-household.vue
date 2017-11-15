<template>
    <div class="household">
        <input v-model="name"/>
        <button @click.prevent="createHousehold">Create Household</button>
    </div>
</template>
<script>
import axios from "axios";

export default {
  name: "household",
  inject: ["api"],
  methods: {
    createHousehold: function() {
      axios
        .post(
          `${this.api}/households`,
          {
            household: {
              name: this.name
            }
          },
          {
            headers: { Authorization: `Bearer ${this.$store.getters.auth}` }
          }
        )
        .then(response => {
          console.log(response.data);
        })
        .catch(reason => console.log(reason));
    }
  }
};
</script>
