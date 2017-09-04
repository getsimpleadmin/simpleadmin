$(document).ready(function() {
  if(!!$('#tags').length) {
    $('#tags').tagsInput({ width: '100%', height: '36px' });
  }

  if(!!$('.best_in_place').length) {
    $(".best_in_place").best_in_place();
  }
});
