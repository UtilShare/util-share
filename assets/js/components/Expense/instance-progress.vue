<template>
  <div class="progress">
    <div
      :class="classes"
      role="progressbar"
      :style="style"
      aria-valuemin="0"
      :aria-valuenow="current"
      :aria-valuemax="total"
    >
    </div>
  </div>
</template>

<script>
import _ from 'lodash'

export default {
  props: ['instance'],
  name: 'instance-progress',

  computed: {
    style() {
      let percent = (100 * this.current) / this.total
      return `width: ${percent}%`
    },

    current() {
      return _.filter(this.instance.splits, 'complete').length
    },

    total() {
      if(this.instance.splits){
        return this.instance.splits.length
      }
      return 0;
    },

    classes() {
      if (this.instance.complete) return ['progress-bar', 'bg-success']
      return 'progress-bar'
    }
  }
}
</script>
