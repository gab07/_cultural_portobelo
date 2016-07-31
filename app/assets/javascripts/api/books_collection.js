var BooksCollection = function(){
  this.books = []
  this.url = "api/books/?utf8=%E2%9C%93&search="
}

BooksCollection.prototype.fetch = function(query, callback){
  var request = $.get(this.url + query)
  var collection = this
  request.done(function(result){
    collection.books = result
    callback();
  })
}