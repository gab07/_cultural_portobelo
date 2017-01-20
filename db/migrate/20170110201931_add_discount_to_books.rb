class AddDiscountToBooks < ActiveRecord::Migration
  def change
    add_column :books, :discount, :decimal, precision: 5, scale: 2
    change_column :books, :price, :decimal, precision: 5, scale: 2
  end
end
