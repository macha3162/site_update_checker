class SitesController < ApplicationController
  before_action :set_site, only: %i[show edit update check destroy]

  def index
    @q = Site.ransack(params[:q])
    @sites = @q.result.page(params[:page])
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
      SiteCrawlJob.perform_later(@site)
      redirect_to @site, notice: 'Site was successfully created.'
    else
      render :new
    end
  end

  def update
    if @site.update(site_params)
      SiteCrawlJob.perform_later(@site)
      redirect_to @site, notice: 'Site was successfully updated.'
    else
      render :edit
    end
  end

  def check
    @site.check!
    redirect_to sites_url, notice: 'Site was successfully checked.'
  end

  def crawl
     Site.find_each do |site|
       SiteCrawlJob.perform_later(site)
     end
     redirect_to sites_url, notice: 'crawl job was created.'
  end

  def destroy
    @site.destroy
    redirect_to sites_url, notice: 'Site was successfully destroyed.'
  end

  private

  def set_site
    @site = Site.find(params[:id]||params[:site_id])
  end

  def site_params
    params.require(:site).permit(:name, :url, :start_with, :end_with)
  end
end
