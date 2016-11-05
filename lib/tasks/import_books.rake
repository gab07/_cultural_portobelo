require 'csv'
  
task :create_books => :environment do
  data = File.open('/Users/fahenao/Desktop/books_csv.csv', "r:ISO-8859-1")
  csv = CSV.parse(data, :headers => true)
  csv.each do |row|
    # Replace the 'special characters' with UTF-8 characters in title
    row['title'].gsub!('!','Á')
    row['title'].gsub!('@','É')
    row['title'].gsub!('$','Í')
    row['title'].gsub!('%','Ó')
    row['title'].gsub!('&','Ú')
    row['title'].gsub!('/','Ñ')

    # Replace the 'special characters' with UTF-8 characters in author
    row['author'].gsub!('!','á')
    row['author'].gsub!('@','é')
    row['author'].gsub!('$','í')
    row['author'].gsub!('%','ó')
    row['author'].gsub!('&','ú')
    row['author'].gsub!('/','ñ')

    # Replace the 'special characters' with UTF-8 characters in country_of_origin
    row['country_of_origin'].gsub!('!','á')
    row['country_of_origin'].gsub!('@','é')
    row['country_of_origin'].gsub!('$','í')
    row['country_of_origin'].gsub!('%','ó')
    row['country_of_origin'].gsub!('&','ú')
    row['country_of_origin'].gsub!('/','ñ')

    # Replace the 'special characters' with UTF-8 characters in description
    row['description'].gsub!('!','á')
    row['description'].gsub!('@','é')
    row['description'].gsub!('$','í')
    row['description'].gsub!('%','ó')
    row['description'].gsub!('&','ú')
    row['description'].gsub!('/','ñ')

    # Replace the 'special characters' with UTF-8 characters in categories
    row['categories'].gsub!('!','á')
    row['categories'].gsub!('@','é')
    row['categories'].gsub!('$','í')
    row['categories'].gsub!('%','ó')
    row['categories'].gsub!('&','ú')
    row['categories'].gsub!('/','ñ')


    book = Book.new(
      :title => row['title'], 
      :author => row['author'], 
      :publisher => row['publisher'], 
      :publication_year => row['publication_year'],
      :price => row['price'], 
      :cover => File.new("/Users/fahenao/Desktop/pw/#{row['cover']}.jpg"), 
      :country_of_origin => row['country_of_origin'], 
      :description => row['description'],
    )
    book.save!
    book_id = Book.last.id
    category = Category.find_by(name:"#{row['categories']}")
    if category.nil?
      Category.create!(:name => category)
    else
      category_id = category.id
    end
    BookCategoryRelation.create!(
      :book_id => book_id,
      :category_id => category_id,
    )
	end

end
