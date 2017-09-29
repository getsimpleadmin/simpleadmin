$(document).ready ->
  if ! !$('#tabs').length
    $('#tabs').tabs()

  if ! !$('#tags').length
    $('#tags').tagsInput
      width: '100%'
      height: '36px'

  if ! !$('.best_in_place').length
    $('.best_in_place').best_in_place()

  if ! !$('.notify').length
    $('button.close').click ->
      $('.notify').remove()

  if ! !$('.change-password').length
    $passwordChange = $('input[name="password_change"]')

    $('.change-password .block-header').click ->
      $('.change-password').toggleClass 'active'
      $passwordChange.val if $passwordChange.val() == 'true' then 'false' else 'true'
