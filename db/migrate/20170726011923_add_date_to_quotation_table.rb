class AddDateToQuotationTable < ActiveRecord::Migration
  def change
  	add_column :quotations, :date, :date
  end
end
