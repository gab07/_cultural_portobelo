$(document).ready(function () {
  function search_query() {
    var query = $('#search').val()
    router.collection.fetch(query, function () {
      router.BookComponent.render() 
    })
  }

  $('#search-form').on("submit",function(event){
    event.preventDefault()
  })
  
  $('#all-books').click(function(event){
    event.preventDefault()
    $('#search').val("")
    search_query()
  })

  $('#ciencias-politicas').click(function(event){
    event.preventDefault()
    $('#search').val("politicas")
    search_query()
  })

  $('#derecho-penal').click(function(event){
    event.preventDefault()
    $('#search').val("penal")
    search_query()
  })

  var $container = $('.books');            
  $container.imagesLoaded(function(){                 
     $container.masonry({
        itemSelector: '.box.panel',
     });
  });
})
