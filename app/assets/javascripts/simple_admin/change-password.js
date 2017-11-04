$(document).ready(function() {
  if(!!$('.change-password').length) {
    var $passwordChange = $('input[name="password_change"]');

    $('.change-password .block-header').click(function() {
      $('.change-password').toggleClass('active');

      $passwordChange.val($passwordChange.val() === 'true' ? 'false' : 'true');
    });
  }
});
