$(document).ready(function () {
  $('#interested-book').click(function(){
    $('#contact-book').toggle()
  })

  function search_query() {
    var query = $('#search').val()
    router.collection.fetch(query, function () {
      router.BookComponent.render()
    })
  }
  $('#search-form').on("submit",function(event){
    event.preventDefault()
  })
  
})

