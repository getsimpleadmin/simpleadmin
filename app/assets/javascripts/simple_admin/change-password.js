$(document).ready(function() {
  // if(!!$('.change-password').length) {
  //   var $passwordChange = $('input[name="password_change"]');
  //
  //   $('.change-password .block-header').click(function() {
  //     $('.change-password').toggleClass('active');
  //
  //     $passwordChange.val($passwordChange.val() === 'true' ? 'false' : 'true');
  //   });
  // }

  if (!!$('.password-fields').length) {
    var $passwordFields = $('.password-fields')
    $passwordFields.hide();

    $('.btn-change-password').click(function() {
      // if ( $passwordFields.css('visibility') == 'hidden' ) {
      //   $passwordFields.show();
      // } else {
      //   $passwordFields.hide();
      // }

      $passwordFields.toggle();
    });
  }
});
