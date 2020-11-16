# frozen_string_literal: true

module ShortUrlManager
  module Converters
    # Seeding with secret key base, so the alphabet will be shuffled the same way every launch
    SEED = (ENV['SECRET_KEY_BASE'] || Rails.application.secret_key_base).to_i(16)
    RANDOM_GENERATOR = Random.new(SEED).freeze
    ALPHABET = ShortUrl::CHARACTERS.shuffle(random: RANDOM_GENERATOR).freeze

    class Base < ApplicationService
      attr_reader :from

      def initialize(from)
        @from = from
      end
    end
  end
end
