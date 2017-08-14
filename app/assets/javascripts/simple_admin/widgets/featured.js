$(document).ready(function() {
  $('body').click(function() {
    $('.dropdown-menu').hide();
  });

  $('.autocomplete').keyup(function() {
    var inputValue = this.value,
        currentLocale = $(this).data('locale');

    $('.dropdown-menu').show();

    $.ajax({
      type:'GET',
      url:'/admin/' + currentLocale +'/widgets/featured/autocomplete',
      data: {
        title: inputValue
      },
      success: function(posts) {
        $( "ul.dropdown-menu > li" ).remove();

        if(posts.length > 0) {
          posts.forEach(function(post) {
           $('.dropdown-menu').append("<li><a href='#' data-id=" + post.id + ">" + post.title + "</a></li>");
          });
        } else {
          $('.dropdown-menu').append("<li><a>Nothing found</a></li>");
        }

        $('.dropdown-menu > li > a').on('click', function() {
          if($(this).data('id') != undefined) {
            $('.featured__news').append('<div class="feature__item"><a class="remove__post_item" href="#">Remove</a> |<span>' + this.text + '</span><input type="hidden" value="' + $(this).data('id') + '" name="post_ids[]"></div>');
          }
        });
      }
    });
  });

  $('.remove__post_item').on('click', function() {
    $(this).parent().remove();
  });
});
