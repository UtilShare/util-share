import axios from 'axios';

export default {
  inject: ["api"],

  computed: {
    authHeaders() {
      return {
        Authorization: `Bearer ${this.$store.getters.auth}`
      }
    }
  },

  methods: {
    sendRequest(path, method, data={}) {
      return axios({
        method: method,
        url: `${this.api}/${path}`,
        headers: this.authHeaders,
        data
      })
    }
  }
}
