# frozen_string_literal: true

json.urls do
  json.array! @short_urls, partial: 'short_url', as: :short_url
end
