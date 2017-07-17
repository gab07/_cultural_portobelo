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
                            bookTemplate += "<div class='col-md-12 img-container'>"
                                bookTemplate += "<img class='img img-responsive img-rounded well-image' src="+ book.image_url + ">"
                            bookTemplate += "</div>"
                        bookTemplate += "</div>" // image-container

                        bookTemplate += "<div class='col-xs-12 book-info'>"
                            bookTemplate += "<div class='row'>"
                                bookTemplate += "<h6><strong>"+ title + "</strong></h6>"
                            bookTemplate += "</div>" //book-title

                            bookTemplate += "<div class='row'>"
                                bookTemplate += "<p><strong>Autor: </strong>"+ author +"</p>"
                            bookTemplate += "</div>" // book-author
                        bookTemplate += "</div>"

                        // bookTemplate += "<div class='row'>"
                        //     bookTemplate += "<% if current_user %>"
                        //         bookTemplate += "<%= link_to edit_book_path(book) do %>
                        //         <span class='glyphicon glyphicon-pencil'></span>"
                        //         bookTemplate += "<% end %> "
                        //         bookTemplate += "Editar"

                        //         bookTemplate += "<%= link_to book, method: :delete, data: { confirm: 'Are you sure?' } do %>
                        //         <span class='glyphicon glyphicon-trash'></span>"
                        //         bookTemplate += "<% end %>" 
                        //         bookTemplate += "Eliminar" 
                                            
                        //     bookTemplate += "<% end %>"
                        // bookTemplate += "</div>" // Editar|Eliminar

                bookTemplate += "</div>"
            bookTemplate += "</div>"
        bookTemplate += "</a>"
    	return bookTemplate
    }

BookComponent.prototype.render = function(){
  var component = this
  var book_ids = [];

  $(".books-wrapper").empty()
  this.collection.books.forEach(function(book){
        $(".books-wrapper").append(component.template(book));
  })
}






