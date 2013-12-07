class VclDistributor
  @queue = :vcl_distributor

  def self.perform(server_id)
  	vcl_url = 'http://' + Rails.application.routes.default_url_options[:host] + '/vcl'
  	vcl = `curl #{vcl_url}`

  	server = VarnishServer.find(server_id)

  	key = "/Users/darron/.ssh/id_dsa" if Rails.env == 'development'
    key = "/home/app/.ssh/id_dsa" if Rails.env == 'production'
    
    system "echo '#{vcl}' | ssh -o StrictHostKeyChecking=no -q vcl@#{server.ip} -p #{server.port} -i #{key} 'cat > default.vcl'"
  end
end
