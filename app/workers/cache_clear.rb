class CacheClear
  require Rails.root + "lib/applog"
  @queue = :cache_clear

  def self.perform(url, server_id)
  	server = VarnishServer.find(server_id)
  	site = Website.find_by_token(url)

  	key = "/Users/darron/.ssh/id_dsa" if Rails.env == 'development'
    key = "/home/app/.ssh/id_dsa" if Rails.env == 'production'

    CUSTOM_LOGGER.info "Actually clearing #{url}.#{CDN_URL} on #{server.title} at #{server.ip}"

    # ban.url http://nonfiction.ca/.*
    # https://www.varnish-cache.org/docs/trunk/tutorial/purging.html
    # http://dharrigan.com/2012/01/05/banning-urls-from-varnish-using-apache-camel-and-rabbitmq-part-2/
    command = "sudo /usr/bin/varnishadm -T 127.0.0.1:6082 -S /etc/varnish/secret \"ban req.http.host == '#{url}.#{CDN_URL}' && req.http.url ~ '^/.*'\";"
    unless site.vhost.blank?
      command += "sudo /usr/bin/varnishadm -T 127.0.0.1:6082 -S /etc/varnish/secret \"ban req.http.host == '#{site.vhost}' && req.http.url ~ '^/.*'\";"
    end
    system "ssh -o StrictHostKeyChecking=no -q vcl@#{server.ip} -p #{server.port} -i #{key} '#{command}'"

  end
end
