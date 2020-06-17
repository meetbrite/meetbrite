import consumer from "./consumer"

document.addEventListener('turbolinks:load', () => {
  // console.log("direct_id", direct_id)
 const direct_id = document.getElementById('direct_id').value 
  // console.log("direct_id", direct_id)

consumer.subscriptions.create({channel: "DirectChannel", direct_id: direct_id}, {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log("Connected to Direct Channel!!!");
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    const messageContainer = document.getElementById('messages')
    messageContainer.innerHTML = messageContainer.innerHTML + data.html
    //automate message scrolling 
    var objDiv = document.getElementById("message-scroll-bottom");
    objDiv.scrollTop = objDiv.scrollHeight;
  }
});

});