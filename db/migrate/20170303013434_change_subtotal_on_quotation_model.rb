class ChangeSubtotalOnQuotationModel < ActiveRecord::Migration
  def change
  	change_column :quotations, :subtotal, 'decimal USING CAST(subtotal AS decimal)', precision: 12, scale: 2
  end
end
