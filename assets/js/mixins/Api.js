import axios from 'axios';

export default {
  inject: ["api"],

  methods: {
    sendRequest(path, method, data={}) {
      if (this.$store.getters.auth)
        headers = { Authoriazation: `Bearer ${this.$store.getters.auth}`  }
      else
        headers = {}

      const emitError = (msg) => {
        this.$store.commit(ADD_ALERT, {
          alert: {
            message: reason.response.data.error,
            type: 'danger'
          }
        })
      }

      return axios({
        method: method,
        url: `${this.api}/${path}`,
        headers,
        data
      }).catch(reason => {
        if (reason.response.data.error) {
          emitError(reason.response.data.error)
        } else if (reason.response.data.errors) {
          reason.response.errors.forEach(emitError)
        } else {
          emitError("An unexpected error occurred")
        }
      });
    }
  }
}
