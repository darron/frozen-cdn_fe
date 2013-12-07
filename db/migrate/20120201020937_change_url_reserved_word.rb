class ChangeUrlReservedWord < ActiveRecord::Migration
  def change
  	rename_column :websites, :url, :weburl
  end

end
