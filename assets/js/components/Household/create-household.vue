<template>
    <div class="household">
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
import ApiMixin from "../../mixins/Api";

export default {
  name: "household",
  mixins: [ApiMixin],
  data() {
    return {
      roommates: [this.$store.state.user.email],
      search: ""
    };
  },
  methods: {
    addMember() {
      this.roommates.push(this.search);
      this.search = "";
    },

    createHousehold() {
      this.sendRequest('households', 'POST', { household: { name: this.name } })
        .then(response => {
          this.sendRequest(
            `households/${response.data.id}`, 'PATCH', {
              user_emails: this.roommates
            })
        })
        .catch(reason => console.log(reason));
    }
  }
};
</script>
