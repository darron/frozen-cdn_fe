class AddUserTimeZones < ActiveRecord::Migration
  def up
  	add_column :users, :time_zone, :string, :default => 'Mountain Time (US & Canada)'
  end

  def down
  	remove_column :users, :time_zone
  end
end
