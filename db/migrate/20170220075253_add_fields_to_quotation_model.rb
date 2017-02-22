class AddFieldsToQuotationModel < ActiveRecord::Migration
  def change
		add_column :quotations, :subtotal, :string, precision: 12, scale: 2
		add_column :quotations, :tax, :decimal, precision: 12, scale: 2
		add_column :quotations, :shipping, :decimal, precision: 12, scale: 2
		add_column :quotations, :total, :decimal, precision: 12, scale: 2
		add_column :quotations, :quotation_status, :decimal, :limit => 4
		add_column :quotations, :user_id, :integer
		add_column :quotations, :client_id, :integer
  end
end
