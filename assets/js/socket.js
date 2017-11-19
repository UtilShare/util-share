import {Socket} from "phoenix"
import store from "./store"
import {ADD_REQUESTS, ADD_ALERT} from "./store/mutation-types"

export default {
  subscribe(store) {
    let user = store.state.user
    let socket = new Socket("/socket", {params: { token: user.auth }})
    socket.connect()

    let channel = socket.channel(`updates:${user.id}`, {})
    channel.join()
      .receive("ok", resp => { console.log("Joined successfully", resp) })
      .receive("error", resp => { console.log("Unable to join", resp) })

    channel.on("request", req => {
      store.commit(ADD_ALERT, { alert: {
        message: "You've just received a payment request!",
        type: "info"
      } })
      store.commit(ADD_REQUESTS, { requests: [req] })
    })
  },

  unsubscribe(store) {
    // TODO
  }
}
