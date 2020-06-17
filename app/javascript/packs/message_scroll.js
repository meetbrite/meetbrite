
//this code is to scroll the messages view to display new messages as they come in.  

var timer = window.setInterval(function() {
    var objDiv = document.getElementById("message-scroll-bottom");
    if (!objDiv){
        console.log("cleared")
        clearInterval(timer);
    }
    objDiv.scrollTop = objDiv.scrollHeight;
    console.log("running");
  }, 1000);

