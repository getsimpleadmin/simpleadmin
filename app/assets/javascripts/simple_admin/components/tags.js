$(document).ready(function() {
  var $tagsTag   = $('#tags');
  var parameters = {
    width:  '100%',
    height: '36px'
  };

  if (!!$tagsTag.length) {
    $tagsTag.tagsInput(parameters);
  }
});
