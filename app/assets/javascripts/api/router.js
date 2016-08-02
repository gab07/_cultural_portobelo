var Router = function (){  
  this.collection = new BooksCollection()
  this.BookComponent = new BookComponent(this.collection)
  this.listener()
}

Router.prototype.listener = function (){
  var router = this
  $("#search").on('keyup', function (event){
    var query = $(event.currentTarget).val()
    router.collection.fetch(query, function () {
      router.BookComponent.render()
    })
  })
}
