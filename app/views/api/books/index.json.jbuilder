json.array! @books do |book|
  json.title book.title
  json.author book.author
  json.publisher book.publisher
  json.image_url book.cover.url
  json.id book.id
  json.publication_year book.publication_year
  json.country_of_origin book.country_of_origin
  json.description book.description
  json.price book.price
  json.category book.categories[0].name
end