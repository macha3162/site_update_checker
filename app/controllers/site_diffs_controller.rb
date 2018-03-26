class SiteDiffsController < ApplicationController
  before_action :set_site

  def index
    set_diff_target(@site.current_body)
    render :show
  end

  def show
    set_diff_target(@site.site_versions.find(params[:id]))
  end

  private

  def set_diff_target(current_body)
    @current_body = current_body
    if @current_body.present?
      @previous_body = @current_body.previous
      @next_body = @current_body.next
    end
  end

  def set_site
    @site = Site.find(params[:site_id])
  end
end
