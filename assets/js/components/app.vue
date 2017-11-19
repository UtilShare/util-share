<template>
  <div class="app-container">
    <header class="header padTop">
      <nav class="nav navbar navbar-dark bg-info navbar-expand-md fixed-top">

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#main-navbar">
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse not-full-basis" id="main-navbar">
          <ul class="navbar-nav mr-auto text-center">
            <li class="nav-item">
              <router-link class="nav-link" to="/dashboard">Dashboard</router-link>
            </li>
            <li class="nav-item">
              <router-link class="nav-link" to="/expenses">Expenses</router-link>
            </li>
            <li class="nav-item">
              <router-link class="nav-link" to="/households/new">New Household</router-link>
            </li>
          </ul>
        </div>
        <button v-if="token" type="button" class="btn btn-danger ml-2" @click.prevent="logOut">
          Logout
        </button>
      </nav>
    </header>

    <div class="alert-container">
      <alert :alert="alert" v-for="alert in alerts" :key="alert.id"/>
    </div>

    <router-view class="app-content"></router-view>
  </div>
</template>

<script>

import Alert from "./alert"
import { LOGOUT } from "../store/mutation-types"


export default {
  name: "app",
  components: {
    alert: Alert
  },
  computed: {
    token() {
      return this.$store.getters.auth;
    },
    alerts() {
      return this.$store.state.alerts;
    }
  },

  methods: {
    logOut() {
      this.$store.commit(LOGOUT, {})
      this.$router.push("/user/landing");
    }
  },

  mounted() {
  }
};
</script>
