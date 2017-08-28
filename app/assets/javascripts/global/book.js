$(document).on('turbolinks:load', function(){
  var book__summary = $('.book__summary').text().length;
  if(book__summary > 400){
    var short_summary = $('.book__summary').text().slice(0, 400);
    var long_summary = $('.book__summary').text().slice(400);
    var template = '<span class="book__summary_hidden">%s</span>';
    var hidden_section = template.replace('%s', long_summary);
    $('.book__summary').text(short_summary);
    $('.book__summary').append(hidden_section);
  } else {
    $('.book__read-more').hide();
  }
  $('.book__read-more').on('click', function(e){
    e.preventDefault();
    $('.book__summary_hidden').toggle();
  });
});