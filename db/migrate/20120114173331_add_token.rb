class AddToken < ActiveRecord::Migration
  def up
  	change_table :websites do |t|
      t.string :token
    end
  end

  def down
  	remove_column :websites, :token
  end
end
