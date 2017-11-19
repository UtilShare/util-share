<template>
  <ul class="list-group">
    <li class="list-group-item" :key="instance.id" v-for="instance in visibleInstances">
      <div class="row">
        <div class="col-3">${{ instance.amount }}</div>
        <div class="col-9">
          <instance-progress :instance="instance"/>
        </div>
      </div>
    </li>

    <a href="" v-if="canSeeMore" @click.prevent="seeMore">(See more)</a>
  </ul>
</template>

<script>
import _ from 'lodash'
import InstanceProgress from './instance-progress'

export default {
  props: ['instances'],
  name: 'expense-list',
  components: {
    'instance-progress': InstanceProgress
  },

  data() {
    return {
      toShow: 3
    }
  },

  computed: {
    visibleInstances() {
      return _.slice(this.instances, 0, this.toShow)
    },

    canSeeMore() {
      return this.toShow < this.instances.length
    }
  },

  methods: {
    seeMore() {
      this.toShow += 3
    }
  }
}
</script>
