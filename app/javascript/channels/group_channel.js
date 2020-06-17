import consumer from "./consumer"

document.addEventListener('turbolinks:load', () => {
  const event_id = document.getElementById('event_id').value 
  
  consumer.subscriptions.create({channel: "GroupChannel", event_id: event_id}, {
    connected() {
      // Called when the subscription is ready for use on the server
      console.log("Group Channel connected!!")
    },
  
    disconnected() {
      // Called when the subscription has been terminated by the server
    },
  
    received(data) {
      // Called when there's incoming data on the websocket for this channel
       console.log(data)
      const messageContainer = document.getElementById('messages')
      messageContainer.innerHTML = messageContainer.innerHTML + data.html
      //automate message scrolling 
      var objDiv = document.getElementById("message-scroll-bottom");
      objDiv.scrollTop = objDiv.scrollHeight;
    }
  });

})

