class VarnishServer < ActiveRecord::Base
  require Rails.root + "lib/applog"

	def distribute
		VarnishServer.all.each do |server|
      		Resque.enqueue(VclDistributor, server.id)
    	end
	end

	def clear(url)
		VarnishServer.all.each do |server|
			Resque.enqueue(CacheClear, url, server.id)
      CUSTOM_LOGGER.info "Clearing #{url} on #{server.title} at #{server.ip}"
		end
	end
	
end
