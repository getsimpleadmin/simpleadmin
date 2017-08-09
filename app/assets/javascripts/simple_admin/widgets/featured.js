$(document).ready(function() {
  var inputTag = "input[name='feature_items']";

  $('main').click(function() {
    $('.dropdown-menu').hide();
  });

  $(inputTag).keyup(function() {
    var inputValue = this.value;

    $('.dropdown-menu').show();

    $.ajax({
      type:'GET',
      url:'/admin/en/widgets/featured/autocomplete',
      data: {
        title: inputValue
      },
      success: function(posts) {
        $( "ul.dropdown-menu > li" ).remove();

        if(posts.length > 0) {
          posts.forEach(function(post) {
           $('.dropdown-menu').append("<li><a href='#'>" + post.title + "</a></li>");
          });
        } else {
          $('.dropdown-menu').append("<li><a href='#'>Nothing found</a></li>");
        }

        $('.dropdown-menu > li > a').on('click', function() {
          $('.featured__news').append('<div class="feature__item"><a href="#">Remove</a> |<span>' + this.text + '</span><input type="hidden" name="post[]"></div>');
        });
      }
    });
  });
});
