$(document).ready ->
  if ! !$('.change-password').length
    $passwordChange = $('input[name="password_change"]')

    $('.change-password .block-header').click ->
      $('.change-password').toggleClass 'active'
      $passwordChange.val if $passwordChange.val() == 'true' then 'false' else 'true'
