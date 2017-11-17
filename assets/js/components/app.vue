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
              <a class="nav-link active" href="/">
                Dashboard
              </a>
            </li>
          </ul>
        </div>
        <button v-if="token" type="button" class="btn btn-danger ml-2" @click.prevent="logout">
          Logout
        </button>
      </nav>
    </header>

    <div class="alert-container">
      <alert :alert="alert" v-for="alert in alerts"/>
    </div>

    <router-view class="app-content"></router-view>
  </div>
</template>

<script>
import Alert from "./alert"

export default {
  name: "app",
  components: {
    'alert': Alert
  },
  computed: {
    token() {
      return this.$store.getters.auth;
    },

    alerts() {
      return this.$store.state.alerts
    }
  },

  methods: {
    logOut() {
      //TODO: handle logout
    }
  },

  mounted() {
    if (!this.token) {
      this.$router.push("/user/landing");
    }
  }
};
</script>
