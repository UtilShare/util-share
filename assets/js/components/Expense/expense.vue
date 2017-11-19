<template>
  <div class="expense card">
    <div class="card-body">
      <h4 class="card-title">{{ expense.name }}</h4>
      <h6 class="card-subtitle mb-2 text-muted">{{ expense.household.name }}</h6>
      <p>Owner: {{ expense.owner.first }} {{expense.owner.last}}</p>

      <form class="form-control" @submit.prevent="submitInstance" v-if="isCharging">
        <label :for="expense.id + '-amount'">Amount:</label>

        <div class="input-group">
          <div class="input-group-addon">$</div>
          <input v-model="newInstance.amount" type="number" class="form-control" id="expense.id + '-amount'"/>
        </div>

        <div class="row expense-split" v-for="split in newInstance.splits">
          <div class="col-md-8">
            <label :for="expense.id + '-user-' + split.user.id + '-split'">
              {{ split.user.first }} {{ split.user.last }}:
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

      <br><br>
      <h6 class="card-subtitle mb-2">Instances</h6>
      <instance-list v-if="expense.instances && expense.instances.length" :instances="expense.instances"/>
      <p v-else>No instances yet</p>
    </div>
  </div>
</template>

<script>
import _ from "lodash";

import { ADD_EXPENSE_INSTANCE } from "../../store/mutation-types";
import ExpenseInstanceList from "./instance-list";
import ApiMixin from "../../mixins/Api";

export default {
  name: "expense",
  props: ["expense"],
  mixins: [ApiMixin],
  components: {
    "instance-list": ExpenseInstanceList
  },

  data() {
    return {
      isCharging: false,
      newInstance: this.generateDefaultInstance()
    };
  },

  methods: {
    toggleCharging() {
      this.isCharging = !this.isCharging;
    },

    submitInstance() {
      this.sendRequest("expense_instances", "POST", {
        expense_instance: {
          amount: this.newInstance.amount,
          expense_id: this.expense.id,
          splits: this.newInstance.splits.map(t => {
            return {
              percent: t.percent,
              requestee_id: t.user.id,
            }
          })
        }
      })
        .then(result => {
          this.$store.commit(ADD_EXPENSE_INSTANCE, {
            expense: this.expense,
            instance: result.data
          });
          this.newInstance = this.generateDefaultInstance();
        })
        .catch(reason => {
          this.alertErrors(reason)
          this.toggleCharging();
        })
      this.toggleCharging();
    },

    generateDefaultInstance() {
      let usersForInstance = _.filter(
        this.expense.household.users,
        u => u.id != this.expense.owner.id
      );

      let defaultSplits = _.map(usersForInstance, u => {
        return { user: u, complete: false, percent: 0 };
      });

      return {
        splits: defaultSplits,
        amount: 0
      };
    }
  }
};
</script>
