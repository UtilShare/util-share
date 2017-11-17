import axios from 'axios';
import { ADD_ALERT } from '../store/mutation-types'

export default {
  inject: ["api"],

  methods: {
    alertErrors(error) {
      const emitError = (msg) => {
        this.$store.commit(ADD_ALERT, {
          alert: { message: msg, type: 'danger' }
        })
      }

      if (error.response.data.error) {
        emitError(error.response.data.error)
      } else if (error.response.data.errors) {
        error.response.data.errors.forEach(emitError)
      } else {
        emitError("An unexpected error occurred")
      }
    },

    sendRequest(path, method, data={}) {
      let headers = {}

      if (this.$store.getters.auth)
        headers = { Authoriazation: `Bearer ${this.$store.getters.auth}`  }

      return axios({
        method: method,
        url: `${this.api}/${path}`,
        headers,
        data
      })
    }
  }
}
