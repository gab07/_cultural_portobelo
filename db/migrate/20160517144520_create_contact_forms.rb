class CreateContactForms < ActiveRecord::Migration
  def change
    create_table :contact_forms do |t|
      t.string   :name
      t.string   :email
      t.integer  :phone
      t.string   :profession
      t.text     :comment
      t.timestamps null: false
    end
  end
end
