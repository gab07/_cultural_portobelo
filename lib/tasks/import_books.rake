require 'csv'
  task :create_books => :environment do
  	# Se define el nombre del excel con la info
  	# de los libros que vamos a crear.
  	csv_text = File.read('/Users/fahenao/Desktop/books_db.csv')
  	csv = CSV.parse(csv_text, :headers => true)
  	csv.each do |row|
  		books_data = {:title => row['title'], 
                    :author => row['author'], 
                    :publisher => row['publisher'], 
                    :publication_year => row['publication_year'],
                    :price => row['price'], 
                    :cover => File.new("/Users/fahenao/cultural_portobelo/app/assets/images/#{row['cover']}.jpg"), 
                    :country_of_origin => row['country_of_origin'], 
                    :description => row['description'],
                  }
  		Book.create!(books_data)
      book_id = Book.last.id
      category_id = Category.find_by(name:"#{row['categories']}").id
      relation_data = {:book_id => book_id,
                       :category_id => category_id,
      }
      BookCategoryRelation.create!(relation_data)
  	end
  end