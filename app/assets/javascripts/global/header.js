$(document).on('turbolinks:load', function(){
  $(".headerThird, .fadeScreen").hide();
  $(".headerThird__trigger, .headerThird__close, .fadeScreen").on('click', function(e){
    e.preventDefault();
    $('.headerThird').toggle();
    $('.fadeScreen').toggle();
  });
  $('.search-field').on("click", function(){
    $('#search-f').val("")
    $('#search_form').submit()
  });
  $('.search-field').on("click", function(){
    var keyword = $(this).attr('data-keyword');
    $('#search-f').val(keyword);
    $('#search_form').submit();
  });
});
