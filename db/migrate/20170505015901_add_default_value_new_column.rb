class AddDefaultValueNewColumn < ActiveRecord::Migration
  def up
    change_column :books, :new, :boolean, :default => false
  end

  def down
    change_column :books, :new, :boolean, :default => nil
  end
end
