<template>
  <div class="app-container">
    <header class="header pt-5">
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
    <router-view></router-view>
  </div>
</template>

<script>

export default {
  name: "app",
  computed: {
    token() {
      return this.$store.getters.auth;
    }
  },
  methods: {
    logOut: function() {
      //TODO: handle logout
    }
  },
  mounted: function() {
    debugger;
    if (!this.token) {
      this.$router.push("/user/landing");
    }
  }
};
</script>
