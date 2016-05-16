class Book < ActiveRecord::Base
	has_many :categories
	has_attached_file :cover,
										:styles => { :medium => '300x300', :thumb => '100x100' }
  validates_attachment :cover, content_type: { content_type: /\Aimage\/.*\Z/ }

	validates :title, presence: true
	validates :author, presence: true
	validates :publisher, presence: true
	validates :price, presence: true
	validates :cover, presence: true

	def self.search(search)
		if search

			books = Book.all

			books = where(["title LIKE ?","%#{search}%"])
			books = where(["author LIKE ?","%#{search}%"])
			books = where(["publisher LIKE ?","%#{search}%"])
			books = where(["publication_year LIKE ?","%#{search}%"])
			books = where(["isbn LIKE ?","%#{search}%"])

			return books

		else
			puts "no se encontraron resultados"
			all
		end
	end

end