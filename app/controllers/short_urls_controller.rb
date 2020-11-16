# frozen_string_literal: true

class ShortUrlsController < ApplicationController
  # Since we're working on an API, we don't have authenticity tokens
  skip_before_action :verify_authenticity_token

  def index
    @short_urls = ShortUrl.order(click_count: :desc, id: :asc).first(100)
  end

  def create
    @short_url = ShortUrl.create!(short_url_params)
    UpdateTitleJob.perform_later(@short_url.id)
  end

  def show
    short_url = ShortUrl.find_by_short_code!(params[:id])
    ShortUrlManager::ClickIncrementer.call(short_url)
    redirect_to short_url.full_url
  end

  private

  def short_url_params
    params.permit(:full_url)
  end
end
