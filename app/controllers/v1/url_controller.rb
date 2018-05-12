class V1::UrlController < ApplicationController
  before_action :set_url, only: %i[show destroy]

  def index
    @urls = Url.all
  end

  def show; end

  def create
    @url = Url.new(url_params)
    @url.parse_and_build_content
    if @url.save
      render json: @url, status: :created
    else
      render json: @url, status: :unprocessable_entity
    end
  end

  def destroy
    @url.destroy
  end

  private

  def set_url
    @url = Url.find(params[:id])
  end

  def url_params
    params.require(:url).permit(:link)
  end
end
