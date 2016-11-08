class ChangeCountryOfOrigin < ActiveRecord::Migration
	def change
    Book.where(country_of_origin: 'España').update_all(country_of_origin: 1)
    Book.where(country_of_origin: 'Colombia').update_all(country_of_origin: 0)
    Book.where(country_of_origin: 'Mexico').update_all(country_of_origin: 2)
    Book.where(country_of_origin: 'Panamá').update_all(country_of_origin: 3)
    Book.where(country_of_origin: 'panamá').update_all(country_of_origin: 3)
    Book.where(country_of_origin: 'Argentina').update_all(country_of_origin: 4)
    Book.where(country_of_origin: 'Nicaragua').update_all(country_of_origin: 5)
    change_column :books, :country_of_origin, 'integer USING CAST(country_of_origin AS integer)'
  end
end