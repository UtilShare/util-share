<template>
  <div class="expense card" style="width: 30rem;">
    <div class="card-body">
      <h4 class="card-title">{{ expense.name }}</h4>
      <h6 class="card-subtitle mb-2 text-muted">{{ expense.household.name }}</h6>

      <div v-if="isCharging"></div>
      <a v-else @click.prevent="toggleCharging" class="card-link btn btn-outline-primary">Card link</a>
    </div>
  </div>
</template>

<script>
export default {
  'name': 'expense',
  'props': ['expense'],

  methods: {
    toggleCharging() {
      this.isCharging = !this.isCharging;
    }
  }
}
</script>
