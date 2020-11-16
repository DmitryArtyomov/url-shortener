# frozen_string_literal: true

module ShortUrlManager
  class ClickIncrementer < ApplicationService
    attr_reader :short_url

    def initialize(short_url)
      @short_url = short_url
    end

    def call
      short_url.increment!(:click_count)
    end
  end
end
