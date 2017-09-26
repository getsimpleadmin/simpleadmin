$(document).ready(function() {
  if(!!$('#tabs').length) {
    $('#tabs').tabs();
  }

  if(!!$('#tags').length) {
    $('#tags').tagsInput({ width: '100%', height: '36px' });
  }

  if(!!$('.best_in_place').length) {
    $(".best_in_place").best_in_place();
  }

  if(!!$('.notify').length) {
    $('button.close').click(function() {
      $('.notify').remove();
    });
  }
});
