<template>
  <ul class="list-group">
    <li class="list-group-item" :key="instance.id" v-for="instance in instances">
      <div class="row">
        <div class="col-3">${{ instance.amount }}</div>
        <div class="col-9">
          <instance-progress :instance="instance"/>
        </div>
      </div>
    </li>
  </ul>
</template>

<script>
import InstanceProgress from './instance-progress'

export default {
  props: ['instances'],
  name: 'expense-list',
  components: {
    'instance-progress': InstanceProgress
  }
}
</script>
