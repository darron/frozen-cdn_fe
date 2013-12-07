class AddClusterToWebsiteModel < ActiveRecord::Migration
  def change
  	add_column :websites, :cluster, :integer, :default => '1'
  end
end
