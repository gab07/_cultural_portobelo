require 'csv'

namespace :import_books_csv do

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
  	end
  end
end 