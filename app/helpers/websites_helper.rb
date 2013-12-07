module WebsitesHelper
	def cdn_link(token)
		url = 'http://' + token + '.' + CDN_URL
		link_to(url, url)
	end
end
