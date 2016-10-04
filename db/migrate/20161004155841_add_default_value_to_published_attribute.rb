class AddDefaultValueToPublishedAttribute < ActiveRecord::Migration
 def up
   change_column :books, :published, :boolean, :default => true
 end

 def down
   change_column :books, :published, :boolean, :default => nil
 end
end