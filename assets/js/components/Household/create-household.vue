<template>
    <div class="household">
      <form @submit.prevent="createHousehold" class="form-control">
        <label>Household Name</label>
        <input v-model="name" class="form-control"/>

        <label>Users</label>
        <ul>
          <li v-for="email in roommates" v-bind:key="email">{{email}}</li>
        </ul>

        <label>Find Users</label>
        <form @submit.prevent="addMember">
          <div class="input-group">
            <input type="text" class="form-control" placeholder="User Email..." v-model="search"/>
            <span class="input-group-btn">
              <input type="submit" class="btn btn-primary" value="+"/>
            </span>
          </div>
        </form>
        <input type="submit" class="btn btn-primary"/>
      </form>
    </div>
</template>
<script>
import ApiMixin from "../../mixins/Api"
import { ADD_HOUSEHOLD, ADD_ALERT } from "../../store/mutation-types"

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
            .then(response => {
              this.$store.commit(ADD_ALERT, { alert: {
                message: 'Household created!', type: 'info'
              }})
              this.$store.commit(ADD_HOUSEHOLD, { household: response.data })
              this.$router.push('/dashboard')
            })
            .catch(this.alertErrors);
        })
        .catch(this.alertErrors);
    }
  }
};
</script>
