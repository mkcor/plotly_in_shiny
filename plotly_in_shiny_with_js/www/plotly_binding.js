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

Shiny.outputBindings.register(plotlyOutputBinding, 'pedro.plotlyOutputBinding');
