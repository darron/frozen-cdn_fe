class VarnishServersController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  # GET /varnish_servers
  # GET /varnish_servers.json
  def index
    @varnish_servers = VarnishServer.page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @varnish_servers }
    end
  end

  # GET /varnish_servers/1
  # GET /varnish_servers/1.json
  def show
    @varnish_server = VarnishServer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @varnish_server }
    end
  end

  # GET /varnish_servers/new
  # GET /varnish_servers/new.json
  def new
    @varnish_server = VarnishServer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @varnish_server }
    end
  end

  # GET /varnish_servers/1/edit
  def edit
    @varnish_server = VarnishServer.find(params[:id])
  end

  # POST /varnish_servers
  # POST /varnish_servers.json
  def create
    @varnish_server = VarnishServer.new(params[:varnish_server])

    respond_to do |format|
      if @varnish_server.save
        format.html { redirect_to @varnish_server, notice: 'Varnish server was successfully created.' }
        format.json { render json: @varnish_server, status: :created, location: @varnish_server }
      else
        format.html { render action: "new" }
        format.json { render json: @varnish_server.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /varnish_servers/1
  # PUT /varnish_servers/1.json
  def update
    @varnish_server = VarnishServer.find(params[:id])

    respond_to do |format|
      if @varnish_server.update_attributes(params[:varnish_server])
        format.html { redirect_to @varnish_server, notice: 'Varnish server was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @varnish_server.errors, status: :unprocessable_entity }
      end
    end
  end

  def distribute
    varnish = VarnishServer.new
    varnish.distribute
    respond_to do |format|
      format.html { redirect_to varnish_servers_url, notice: 'Varnish configs were successfully pushed.' }
    end
  end

  # DELETE /varnish_servers/1
  # DELETE /varnish_servers/1.json
  def destroy
    @varnish_server = VarnishServer.find(params[:id])
    @varnish_server.destroy

    respond_to do |format|
      format.html { redirect_to varnish_servers_url }
      format.json { head :ok }
    end
  end
end
