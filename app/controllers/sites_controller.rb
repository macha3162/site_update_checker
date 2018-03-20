class SitesController < ApplicationController
  before_action :set_site, only: %i[show edit update destroy]

  def index
    @sites = Site.all
  end

  def show
    @current_body = @site.site_versions.last
    @previous_body = @current_body.previous if @current_body.present?
  end

  def new
    @site = Site.new
  end

  def edit
  end

  def create
    @site = Site.new(site_params)
    if @site.save
      redirect_to @site, notice: 'Site was successfully created.'
    else
      render :new
    end
  end

  def update
    if @site.update(site_params)
      redirect_to @site, notice: 'Site was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @site.destroy
    redirect_to sites_url, notice: 'Site was successfully destroyed.'
  end

  private

  def set_site
    @site = Site.find(params[:id])
  end

  def site_params
    params.require(:site).permit(:name, :url, :start_with, :end_with)
  end
end
