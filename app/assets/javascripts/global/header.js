$(document).on('turbolinks:load', function(){
  $(".headerThird, .fadeScreen").hide();
  $(".headerThird__trigger, .headerThird__close, .fadeScreen").on('click', function(e){
    e.preventDefault();
    $('.headerThird').toggle();
    $('.fadeScreen').toggle();
  });
  $('#search-input').on("click",function() {
    $(this).val('');
  });
  $('.search-field').on("click", function(e){
    e.preventDefault();
    var keyword = $(this).attr('data-keyword');
    $('#search-input').val(keyword);
    $('form#search-form').submit();
  });
});
