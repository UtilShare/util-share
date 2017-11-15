<template>
  <div class="expense card" style="width: 30rem;">
    <div class="card-body">
      <h4 class="card-title">{{ expense.name }}</h4>
      <h6 class="card-subtitle mb-2 text-muted">{{ expense.household.name }}</h6>
      <p>Owner: {{ expense.owner.name }}</p>

      <form class="form-control" @submit.prevent="toggleCharging" v-if="isCharging">
        <label :for="expense.id + '-amount'">Amount:</label>
        <div class="input-group">
          <div class="input-group-addon">$</div>
          <input type="number" class="form-control" id="expense.id + '-amount'"/>
        </div>

        <div class="row expense-split" v-for="user in usersToCharge">
          <div class="col-md-8">
            <label :for="expense.id + '-user-' + user.id + '-split'">
              {{ user.name }}:
            </label>
          </div>

          <div class="col-md-4">
            <div class="input-group">
              <div class="input-group-addon">%</div>
              <input type="number" class="form-control inline"
                :id="expense.id + '-user-' + user.id + '-split'"/>
            </div>
          </div>
        </div>

        <input type="submit" class="btn btn-primary"/>
      </form>
      <a v-else @click.prevent="toggleCharging" class="card-link btn btn-outline-primary">
        Charge this expense
      </a>
    </div>
  </div>
</template>

<script>
export default {
  'name': 'expense',
  'props': ['expense'],

  data() {
    return {
      isCharging: false
    }
  },

  computed: {
    usersToCharge() {
      return this.expense.household.users.filter(u => u.id != this.expense.owner.id)
    }
  },

  methods: {
    toggleCharging() {
      this.isCharging = !this.isCharging;
    }
  }
}
</script>
