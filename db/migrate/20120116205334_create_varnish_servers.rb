class CreateVarnishServers < ActiveRecord::Migration
  def change
    create_table :varnish_servers do |t|
      t.string :title
      t.string :region
      t.string :ip

      t.timestamps
    end
  end
end
