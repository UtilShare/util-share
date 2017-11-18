<template>
  <div v-if="visible">
    <p class="alert" :class="alertClass" role="alert">
      {{ alert.message }}
      <button type="button" @click.prevent="hide" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
      </button>
    </p>
  </div>
</template>

<script>
export default {
  props: ['alert'],

  data() {
    return { visible: true }
  },

  computed: {
    alertClass() {
      return `alert-${this.alert.type}`
    }
  },

  methods: {
    hide() {
      this.visible = false
    }
  }
}
</script>
