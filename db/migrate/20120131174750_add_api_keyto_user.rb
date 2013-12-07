class AddApiKeytoUser < ActiveRecord::Migration
  def change
  	add_column :users, :api_key, :string, :default => ''
  	User.all.each do |user|
  		uuid = UUID.new
  		api_key = uuid.generate
      	user.update_attributes!(:api_key => api_key)
    end
  end

end
