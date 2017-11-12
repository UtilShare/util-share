<template>
  <div class="app-container">
    <h1>Hello, from Vue!</h1>
    <ul>
      <li><router-link to="/foo">Foo!</router-link></li>
      <li><router-link to="/bar">Bar!</router-link></li>
    </ul>

    <router-view></router-view>
  </div>
</template>

<script>
export default {
  name: 'app'
}
</script>
