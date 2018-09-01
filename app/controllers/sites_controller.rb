class SitesController < ApplicationController
  before_action :set_site, only: %i[show edit update check destroy]

  def index
    @q = Site.ransack(params[:q])
    @sites = @q.result.page(params[:page])
  end

  def show
    redirect_to site_diffs_path(@site)
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
      redirect_to @site, notice: 'サイトを作成し、巡回を開始しました。'
    else
      render :new
    end
  end

  def update
    if @site.update(site_params)
      SiteCrawlJob.perform_later(@site)
      redirect_to @site, notice: 'サイトを更新し、巡回を開始しました。'
    else
      render :edit
    end
  end

  def check
    @site.check!
    redirect_to site_url(@site), notice: 'サイトを確認済み状態にしました。次回のタイミングで調査されます。'
  end

  def crawl
     Site.find_each do |site|
       SiteCrawlJob.perform_later(site)
     end
     redirect_to sites_url, notice: 'サイトの巡回監視を開始しました。'
  end

  def destroy
    @site.destroy
    redirect_to sites_url, notice: 'サイトの削除が完了しました。'
  end

  private

  def set_site
    @site = Site.find(params[:id]||params[:site_id])
  end

  def site_params
    params.require(:site).permit(:name, :url, :start_with, :end_with, :law_no)
  end
end
