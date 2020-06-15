import consumer from "./consumer"

consumer.subscriptions.create({channel: "GroupChannel", event_id: 3}, {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log("Group Channel connected!!")
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    console.log(data.html)
    const messageContainer = document.getElementById('messages')
    messageContainer.innerHTML = messageContainer.innerHTML + data.html
  }
});
