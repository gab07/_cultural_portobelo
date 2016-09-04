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

  $('#derecho-ambiental').click(function(event){
    event.preventDefault()
    $('#search').val("derecho ambiental")
    search_query()
  })

  $('#ciencias-politicas').click(function(event){
    event.preventDefault()
    $('#search').val("ciencias políticas")
    search_query()
  })

  

  $('#derecho-civil').click(function(event){
    event.preventDefault()
    $('#search').val("derecho civil")
    search_query()
  })

  $('#autores-nacionales').click(function(event){
    event.preventDefault()
    $('#search').val("autores nacionales")
    search_query()
  })

  $('#derecho-maritimo').click(function(event){
    event.preventDefault()
    $('#search').val("derecho maritimo")
    search_query()
  })

  $('#derecho-internacional').click(function(event){
    event.preventDefault()
    $('#search').val("derecho internacional")
    search_query()
  })

  $('#derecho-constitucional').click(function(event){
    event.preventDefault()
    $('#search').val("derecho constitucional")
    search_query()
  })

  $('#derecho-administrativo').click(function(event){
    event.preventDefault()
    $('#search').val("derecho administrativo")
    search_query()
  })

  $('#derecho-mercantil').click(function(event){
    event.preventDefault()
    $('#search').val("derecho mercantil")
    search_query()
  })

  $('#derecho-laboral').click(function(event){
    event.preventDefault()
    $('#search').val("derecho laboral")
    search_query()
  })

  $('#derecho-de-familia').click(function(event){
    event.preventDefault()
    $('#search').val("derecho de familia")
    search_query()
  })

  $('#derecho-penal').click(function(event){
    event.preventDefault()
    $('#search').val("derecho penal")
    search_query()
  })

  $('#derecho-informatico').click(function(event){
    event.preventDefault()
    $('#search').val("derecho informatico")
    search_query()
  })

  $('#derecho-juridico').click(function(event){
    event.preventDefault()
    $('#search').val("derecho juridico")
    search_query()
  })

})

