var BookComponent = function(collection){
	this.collection = collection
}

BookComponent.prototype.template = function(book){
	var books = "books/"
    var title = book.title;
    var length = 45;
    var truncateTitle = function (title) {
        if (title.length > 45) {
            title = title.substring(0, length) + ' ...'
            return title
        } else {
            return title
        };
    } 
    var title = truncateTitle(title);
    var author = book.author

    var bookTemplate = "<a href=" + books + book.id + ">"
            bookTemplate += "<div class='col-xs-3'>"
                bookTemplate += "<div class='well sm-well book-container'>"
                    bookTemplate += "<div class='row'>"

                        bookTemplate += "<div class='row'>"
                            bookTemplate += "<div class='col-md-12 img-container'>"
                                bookTemplate += "<img class='img img-responsive img-rounded well-image' src="+ book.image_url + ">"
                            bookTemplate += "</div>"
                        bookTemplate += "</div>" // image-container

                        bookTemplate += "<div class='col-xs-12 book-info'>"
                            bookTemplate += "<div class='row'>"
                                bookTemplate += "<h6><strong>"+ title + "</strong></h6>"
                            bookTemplate += "</div>" //book-title

                            bookTemplate += "<div class='row'>"
                                bookTemplate += "<p><strong>"+ author + "</strong></p>"
                            bookTemplate += "</div>" // book-author
                        bookTemplate += "</div>"

                    bookTemplate += "</div>"
                bookTemplate += "</div>"
            bookTemplate += "</div>"
        bookTemplate += "</a>"
    	return bookTemplate
    }

BookComponent.prototype.render = function(){
  var component = this
  $(".books-wrapper").empty()
  this.collection.books.forEach(function(book){
    $(".books-wrapper").append(component.template(book));
  })
}