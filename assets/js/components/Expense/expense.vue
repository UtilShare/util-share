<template>
  <div class="expense card" style="width: 30rem;">
    <div class="card-body">
      <h4 class="card-title">{{ expense.name }}</h4>
      <h6 class="card-subtitle mb-2 text-muted">{{ expense.household.name }}</h6>
      <p>Owner: {{ expense.owner.name }}</p>

      <form class="form-control" @submit.prevent="submitInstance" v-if="isCharging">
        <label :for="expense.id + '-amount'">Amount:</label>

        <div class="input-group">
          <div class="input-group-addon">$</div>
          <input v-model="newInstance.amount" type="number" class="form-control" id="expense.id + '-amount'"/>
        </div>

        <div class="row expense-split" v-for="split in newInstance.splits">
          <div class="col-md-8">
            <label :for="expense.id + '-user-' + split.user.id + '-split'">
              {{ split.user.name }}:
            </label>
          </div>

          <div class="col-md-4">
            <div class="input-group">
              <div class="input-group-addon">%</div>
              <input type="number" class="form-control inline" v-model="split.percent"
                :id="expense.id + '-user-' + split.user.id + '-split'"/>
            </div>
          </div>
        </div>

        <input type="submit" class="btn btn-primary" value="Charge"/>
        <input type="submit" class="btn btn-secondary" value="Cancel" @click.prevent="toggleCharging"/>
      </form>
      <a v-else @click.prevent="toggleCharging" class="card-link btn btn-outline-primary">
        Charge this expense
      </a>

      <div class="expense-instance row" :key="instance.id"
        v-for="instance in expense.instances">
        {{ instance }}
      </div>
    </div>
  </div>
</template>

<script>
import _ from 'lodash'
import { ADD_EXPENSE_INSTANCE } from "../../store/mutation-types";

export default {
  'name': 'expense',
  'props': ['expense'],

  data() {
    return {
      isCharging: false,
      newInstance: this.generateDefaultInstance()
    }
  },

  methods: {
    toggleCharging() {
      this.isCharging = !this.isCharging;
    },

    submitInstance() {
      // TODO: Submit this to an API once that's a thing
      this.$store.commit(ADD_EXPENSE_INSTANCE, { expense: this.expense, instance: this.newInstance })
      this.newInstance = this.generateDefaultInstance()
      this.toggleCharging();
    },

    generateDefaultInstance() {
      let usersForInstance = _.filter(
        this.expense.household.users,
        u => u.id != this.expense.owner.id
      );

      let defaultSplits = _.map(usersForInstance, u => {
        return { user: u, complete: false, percent: 0 }
      })

      return {
        splits: defaultSplits,
        amount: 0
      }
    }
  }
}
</script>
