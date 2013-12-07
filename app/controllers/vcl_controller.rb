class VclController < ApplicationController
	def index
		@websites = Website.active.paid
		render :layout => false
	end
end
