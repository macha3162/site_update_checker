class SiteVersionsController < ApplicationController
  before_action :set_site_version, only: [:show, :edit, :update, :destroy]

  # GET /site_versions
  # GET /site_versions.json
  def index
    @site_versions = SiteVersion.all
  end

  # GET /site_versions/1
  # GET /site_versions/1.json
  def show
  end

  # GET /site_versions/new
  def new
    @site_version = SiteVersion.new
  end

  # GET /site_versions/1/edit
  def edit
  end

  # POST /site_versions
  # POST /site_versions.json
  def create
    @site_version = SiteVersion.new(site_version_params)

    respond_to do |format|
      if @site_version.save
        format.html { redirect_to @site_version, notice: 'Site version was successfully created.' }
        format.json { render :show, status: :created, location: @site_version }
      else
        format.html { render :new }
        format.json { render json: @site_version.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /site_versions/1
  # PATCH/PUT /site_versions/1.json
  def update
    respond_to do |format|
      if @site_version.update(site_version_params)
        format.html { redirect_to @site_version, notice: 'Site version was successfully updated.' }
        format.json { render :show, status: :ok, location: @site_version }
      else
        format.html { render :edit }
        format.json { render json: @site_version.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /site_versions/1
  # DELETE /site_versions/1.json
  def destroy
    @site_version.destroy
    respond_to do |format|
      format.html { redirect_to site_versions_url, notice: 'Site version was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_site_version
      @site_version = SiteVersion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def site_version_params
      params.require(:site_version).permit(:site_id, :checksum, :body)
    end
end
