# frozen_string_literal: true

class ShortUrl < ApplicationRecord
  CHARACTERS = [*'0'..'9', *'a'..'z', *'A'..'Z'].freeze

  class << self
    def find_by_short_code(code)
      id = ShortUrlManager::Converters::ShortCodeToId.call(code)
      find_by(id: id)
    end

    def find_by_short_code!(code)
      id = ShortUrlManager::Converters::ShortCodeToId.call(code)
      find(id)
    end
  end

  validates :full_url, presence: true, url: true

  def short_code
    ShortUrlManager::Converters::IdToShortCode.call(id) if id.present?
  end

  def update_title!
    ShortUrlManager::TitleUpdater.call(self)
  end
end
