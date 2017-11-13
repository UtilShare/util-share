<template>
    <div>
        <input v-model="email"/>
        <input v-model="first"/>
        <input v-model="last"/>
        <button v-on:click="createUsers">Register</button>
    </div>
</template>

<script>
import axios from "axios";

export default {
  name: "register",
  methods: {
    createUser: function () {
    }
  }
};
</script>
