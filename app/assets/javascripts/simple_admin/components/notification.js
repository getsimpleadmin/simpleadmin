$(document).ready(function() {
  var $closeTag = $('button.close');
  
  $closeTag.click(function() {
    $(this).parent().remove();
  });
});
