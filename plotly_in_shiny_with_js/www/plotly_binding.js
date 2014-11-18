// window.onload = function() {
// 	// Get the window displayed in the iframe.
// 	var receiver = document.getElementById('plotly_output');
  
// 	// Get a reference to the 'Send Message' button.
// 	var btn = document.getElementById('send');

// 	// A function to handle sending messages.
// 	function sendMessage(e) {
// 		// Prevent any default browser behaviour.
// 		e.preventDefault();

// 		// Send a message with the text 'Do you roger me Plotly?' to the new window.
// 		//receiver.postMessage('restyle: {"marker.color": "red", "opacity": [0.3, 0.4]}, traces: [0, 1]', 'https://plot.ly');
// 		receiver.contentWindow.postMessage({
//       restyle: {
//         'marker.color': 'red',
//         'opacity': [0.3, 0.4]
//       }, 
//       traces: [0, 1]
//     }, 'https://plot.ly');
// 	};

// 	// Add an event listener that will execute the sendMessage() function
// 	// when the send button is clicked.
// 	btn.addEventListener('click', sendMessage);
// };

// This output binding handles statusOutputBindings
var plotlyOutputBinding = new Shiny.OutputBinding();
$.extend(plotlyOutputBinding, {
  find: function(scope) {
    return scope.find('.plotly_output');
   }});

// A function to handle sending messages.
$(document).ready(function() {
  $('#sendbuttom').click(sendText);

  function sendText() {

    var data = $('#inputtext').val();

    $('#plot')[0].contentWindow.postMessage({
      restyle: {
        'marker.color':data, 
        'opacity': [0.3, 0.4, 0.5]}
      }, 'https://plot.ly'); 
  };
});
  

  //sendtext() {
  // Prevent any default browser behaviour.
  //el.defaultPrevented;

  // Send a message with the text 'Do you roger me Plotly?' to the new window.
  //receiver.postMessage('restyle: {"marker.color": "red", "opacity": [0.3, 0.4]}, traces: [0, 1]', 'https://plot.ly');

//   $('#plot')[0].contentWindow.postMessage({
//     restyle: {
//       'marker.color': 'read', 
//       'opacity': [0.3, 0.4, 0.5]
//     },
//   }, 'https://plot.ly');
// });

//sendMessage();

//   renderValue: function(el, data) {
//     if (!$(el).data('data_plotly')) {
//       // If we haven't initialized this gauge yet, do it
//       $(el).data('data_plotly', new Plotly({
//         id: this.getId(el),
//         value: 0,
//         min: 0,
//         max: 200,
//         title: "Mean of last 10",
//         label: "units"
//       }));
//     }
//     $(el).data('data_plotly').refresh(data);
//   }
// });

Shiny.outputBindings.register(plotlyOutputBinding, 'pedro.plotlyOutputBinding');


