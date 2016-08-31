$(document).ready(function () {
  $('#search-form').on("submit",function(event){
    event.preventDefault()
  })

  function search_query() {
    var query = $('#search').val()
    router.collection.fetch(query, function () {
      router.BookComponent.render()
    })
  }
  
  $('#all-books').click(function(event){
    event.preventDefault()
    $('#search').val("")
    search_query()
  })

  $('#codigos').click(function(event){
    event.preventDefault()
    $('#search').val("codigos")
    search_query()
  })

  $('#ciencias-politicas').click(function(event){
    event.preventDefault()
    $('#search').val("ciencias políticas")
    search_query()
  })

  $('#derecho-penal').click(function(event){
    event.preventDefault()
    $('#search').val("derecho penal")
    search_query()
  })

  $('#derecho-civil').click(function(event){
    event.preventDefault()
    $('#search').val("derecho civil")
    search_query()
  })

})

