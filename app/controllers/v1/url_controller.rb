class V1::UrlController < ApplicationController
  before_action :set_url, only: %i[show destroy]

  def index
    @urls = Url.all
  end

  def show; end

  def create
    @url = Url.new(url_params)
    @url.parse_and_build_content
    if @url.save!
      render 'v1/url/show', status: :created
    else
      render 'v1/url/show', status: :unprocessable_entity
    end
  end

  def destroy
    url_id = @url.id
    if @url.destroy
      render json: { "message": "Destroyed the URL with id: #{url_id}" }
    end
  end

  private

  def set_url
    @url = Url.find(params[:id])
  end

  def url_params
    params.require(:url).permit(:link)
  end
end
