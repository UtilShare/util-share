<template>
  <p class="alert" :class="alertClass" role="alert">
    {{ alert.message }}
  </p>
</template>

<script>
export default {
  props: ['alert'],

  computed: {
    alertClass() {
      return `alert-${alert.type}`
    }
  }
}
</script>
