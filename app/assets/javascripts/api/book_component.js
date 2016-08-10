var BookComponent = function(collection){
	this.collection = collection
}

BookComponent.prototype.template = function(book){
	var books = "books/"
  var title = book.title;
  var length = 25;
  var truncateTitle = function (title) {
    if (title.length > 25) {
      title = title.substring(0, length) + ' ...'
      return title
    } else {
      return title
    };
  } 
  var title = truncateTitle(title);

  var bookTemplate = "<a href=" + books + book.id + ">"
      bookTemplate += "<div class='box panel panel-default masonry-brick'>"
      bookTemplate += "<img class='product-img' src="+ book.image_url + ">"
      bookTemplate += "<div class='panel-body'>"
      bookTemplate += "<p id='index_title'>"+ title + "</p>"
      bookTemplate += "<p id='index_author'>" + book.author + "</p>"
      bookTemplate += "<p id='index_price'>$"+ parseInt(book.price) + "</p>"
    bookTemplate += "</div></div></a>"
	return bookTemplate
}
BookComponent.prototype.render = function(){
  var component = this
  $(".transitions-enabled").empty()
  this.collection.books.forEach(function(book){
    $(".transitions-enabled").append(component.template(book)) && $('.transitions-enabled').change().masonry('reload');
  })
   
}