import axios from 'axios';

export default {
  inject: ["api"],

  methods: {
    sendRequest(path, method, data={}) {
      return axios({
        method: method,
        url: `${this.api}/${path}`,
        headers: {
          Authorization: `Bearer ${this.$store.getters.auth}`
        },
        data
      })
    }
  }
}
