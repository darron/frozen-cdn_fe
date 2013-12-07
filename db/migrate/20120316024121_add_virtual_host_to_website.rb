class AddVirtualHostToWebsite < ActiveRecord::Migration
  def change
  	add_column :websites, :vhost, :string
  end
end
