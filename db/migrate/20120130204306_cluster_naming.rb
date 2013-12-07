class ClusterNaming < ActiveRecord::Migration
  def change
  	rename_column :varnish_servers, :cluster, :vcluster_id
  end

end
