require 'resque/server'

Resque::Server.use Rack::Auth::Basic, "Restricted Area" do |username, password|
  username == "username"
  password == "enter-your-own-here"
end
