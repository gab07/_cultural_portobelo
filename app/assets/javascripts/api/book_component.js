var BookComponent = function(collection){
	this.collection = collection
}

// ERROR error
BookComponent.prototype.template = function(book){
	var books = "books/"
	var bookTemplate = book.title

	return bookTemplate
}
BookComponent.prototype.render = function(){
  var component = this
  $(".col-md-8.main_content").empty()
  console.log(this.collection)
  this.collection.books.forEach(function(book){
    $(".col-md-8.main_content").append(component.template(book))
  })
}