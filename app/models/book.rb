class Book < ActiveRecord::Base

	has_attached_file :cover,
										:styles => { :medium => '300x300', :thumb => '100x100' }
  validates_attachment :cover, content_type: { content_type: /\Aimage\/.*\Z/ }

	validates :title, presence: true
	validates :author, presence: true
	validates :publisher, presence: true
	validates :pages, presence: true
	validates :binding_type, presence: true
	validates :price, presence: true
	validates :cover, presence: true

	def self.search(search)
		if search 
			where(["title LIKE ?","%#{search}%"])
		else
			all
		end
	end
end
