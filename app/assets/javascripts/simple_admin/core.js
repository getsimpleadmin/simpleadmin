$(document).ready(function() {
  if (!!$('#tabs').length) {
    $('#tabs').tabs();
  }

  if (!!$('#tags').length) {
    $('#tags').tagsInput({
      width: '100%',
      height: '36px'
    });
  }
});
