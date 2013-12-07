class CreateWebsites < ActiveRecord::Migration
  def change
    create_table :websites do |t|
      t.string :url
      t.integer :ttl
      t.boolean :active
      t.boolean :paid
      t.integer :user_id

      t.timestamps
    end
  end
end
