class AddDvToClientModel < ActiveRecord::Migration
  def change
  	add_column :clients, :dv, :integer
  end
end
