<template>
  <div class="app-container">
    <h1>Hello, from Vue!</h1>
    <ul>
      <li><router-link to="/user/register">Register</router-link></li>
    </ul>

    <router-view></router-view>
  </div>
</template>

<script>
export default {
  name: 'app'
}
</script>
