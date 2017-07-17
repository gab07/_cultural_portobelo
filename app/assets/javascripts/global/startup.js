$(document).ready(function () {
  $('.scrollup').click(function () {
    $("html, body").animate({
      scrollTop: 0
    }, 200);
    return false;
  });
});

document.addEventListener("turbolinks:load", function() {
  initMap();
});
