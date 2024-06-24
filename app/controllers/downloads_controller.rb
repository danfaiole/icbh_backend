class DownloadsController < ApplicationController
  before_action :set_download, only: [:show, :edit, :update, :destroy]

  def index
    respond_to do |format|
      format.html
      format.json { render json: DownloadDatatable.new(view_context) }
    end
  end

  def show
  end

  def new
    @download = Download.new
  end

  def edit
  end

  def create
    @download = Download.new(download_params)

    respond_to do |format|
      if @download.save
        format.html { redirect_to @download, notice: 'Arquivo enviado com sucesso.' }
        format.json { render :show, status: :created, location: @download }
      else
        format.html { render :new }
        format.json { render json: @download.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @download.update(download_params)
        format.html { redirect_to @download, notice: 'Arquivo atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @download }
      else
        format.html { render :edit }
        format.json { render json: @download.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @download.destroy
    respond_to do |format|
      format.html { redirect_to downloads_url, notice: 'Arquivo apagado com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    def set_download
      @download = Download.find(params[:id])
    end

    def download_params
      params.require(:download).permit(:title, :description, :document)
    end
end
