<template>
  <div class="app-container">
    <header class="header has-top-bar">
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
    <button type="button" class="btn btn-success ml-2" data-toggle="modal" data-target="#loginModal">
      Login
    </button>
  </nav>
</header>

    <h1>Hello, from Vue!</h1>
    <ul>
      <li><router-link to="/user/register">Register</router-link></li>
      <li><router-link to="/user/login">Login</router-link></li>
      <li><router-link to="/household/create">Create Household</router-link></li>
    </ul>
    <router-view></router-view>
    <div id="loginModal" class="modal fade" aria-hidden="true" style="display: none;">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">Login</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">×</span>
            </button>
          </div>
          <div class="modal-body">
            <form class="form p-2" id="login-form">
              <div class="input-group mb-2">
                <input class="form-control" id="user_email" name="email" placeholder="email" type="text"> </div>
              <div class="input-group">
                <input class="form-control" id="user_password" name="password" placeholder="password" type="password"> </div>
            </form>
          </div>
          <div class="modal-footer">
            <button id="login-submit" type="button" class="btn btn-primary">Login</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "app",
  methods:{
    openLoginModal:()=>{

    }
  }
};
</script>
