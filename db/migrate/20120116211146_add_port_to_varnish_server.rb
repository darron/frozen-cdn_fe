class AddPortToVarnishServer < ActiveRecord::Migration
  def change
  	add_column :varnish_servers, :port, :integer, :default => '22'
  end
end
