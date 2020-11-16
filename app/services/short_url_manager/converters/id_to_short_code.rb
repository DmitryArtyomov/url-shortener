# frozen_string_literal: true

module ShortUrlManager
  module Converters
    class IdToShortCode < Base
      def call
        number = from - 1
        result = []
        begin
          symbol = ALPHABET[number % ALPHABET.length]
          result.unshift(symbol)
          number /= ALPHABET.length
        end while number.positive?
        result.join('')
      end
    end
  end
end
