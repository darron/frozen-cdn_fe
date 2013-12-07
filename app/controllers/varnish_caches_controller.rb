class VarnishCachesController < ApplicationController
  layout "blank"
  require Rails.root + "lib/applog"
  skip_before_filter :verify_authenticity_token

  def verify_api_access
    user = User.find_by_api_key(params[:api_key]) unless params[:api_key].empty?
  end

  def clear
  	respond_to do |format|
      user = self.verify_api_access
      if !user
        CUSTOM_LOGGER.info "Bad API Key from #{request.remote_ip}"
        format.json { render :json => { "status" => 'Invalid API Key' }, :status => :unauthorized }
      else
        site = Website.where(:user_id => user.id, :token => params[:token]).first
        if !site
          CUSTOM_LOGGER.info "Bad Token from #{request.remote_ip}"
          format.json { render :json => { "status" => 'Token Error' }, :status => 400 }
        else
          CUSTOM_LOGGER.info "#{user.email} wants to clear the cache for #{site.weburl} from #{request.remote_ip}"
          # Send to Resque.
          varnish = VarnishServer.new
          varnish.clear(params[:token])
          format.json { head :ok }
        end
      end
    end
  end

end