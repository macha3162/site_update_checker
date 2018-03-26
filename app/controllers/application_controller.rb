class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_login
  after_action :discard_flash_if_xhr

  protected
  def discard_flash_if_xhr
    flash.discard if request.xhr?
  end

  private
  def not_authenticated
    redirect_to login_path, alert: "Please login first"
  end
end
