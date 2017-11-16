<template>
    <div class="household">
      <!-- <form @submit.prevent="createHousehold">
        <input v-model="name"/>
        <input type="submit" value="Create Household"/>
      </form> -->
      <form @submit.prevent="createHousehold" class="form w-25">
        <label>Household Name</label>
        <input v-model="name"/>
        <ul>
          <li v-for="email in roommates" v-bind:key="email">{{email}}</li>
        </ul>
        <label>Find Users</label>
        <div class="input-group">
          <input type="text" class="form-control" placeholder="User Email..." v-model="search"/>
          <span class="input-group-btn">
            <button class="btn btn-primary" @click.prevent="addMember">+</button>
          </span>
        </div>
        <input type="submit"/>
      </form>
    </div>
</template>
<script>
import axios from "axios";

export default {
  name: "household",
  inject: ["api"],
  data: function() {
    return {
      roommates: [],
      search: ""
    };
  },
  methods: {
    addMember() {
      this.roommates.push(this.search);
      this.search = "";
    },
    createHousehold: function() {
      let config = {
        headers: { Authorization: `Bearer ${this.$store.getters.auth}` }
      };
      axios
        .post(
          `${this.api}/households`,
          {
            household: {
              name: this.name
            }
          },
          config
        )
        .then(response => {
          axios.patch(
            `${this.api}/households/${response.data.id}`,
            {
              user_emails: this.roommates
            },
            config
          );
        })
        .catch(reason => console.log(reason));
    }
  }
};
</script>
