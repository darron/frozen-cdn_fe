class DropRolesTable < ActiveRecord::Migration
  def up
  	drop_table :roles
  end

  def down
  end
end
