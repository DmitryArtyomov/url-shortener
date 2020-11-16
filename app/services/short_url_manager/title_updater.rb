# frozen_string_literal: true

require 'open-uri'

module ShortUrlManager
  class TitleUpdater < ApplicationService
    attr_reader :short_url

    def initialize(short_url)
      @short_url = short_url
    end

    def call
      short_url.update(title: title_from_url)
    end

    private

    def title_from_url
      URI.parse(short_url.full_url).open do |file|
        document = Nokogiri::HTML(file)
        document.at_css('title').text
      end
    end
  end
end
