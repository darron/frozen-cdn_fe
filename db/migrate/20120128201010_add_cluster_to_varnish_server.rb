class AddClusterToVarnishServer < ActiveRecord::Migration
  def change
  	add_column :varnish_servers, :cluster, :integer, :default => '1'
  end
end
