$(document).ready(function(){
  $(".headerThird__trigger").on('click', function(e){
    e.preventDefault();
    $('.headerThird').toggle();
  });
  $(".headerThird__close").on('click', function(e){
    e.preventDefault();
    $('.headerThird').toggle();
  });
});
