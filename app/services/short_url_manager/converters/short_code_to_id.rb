# frozen_string_literal: true

module ShortUrlManager
  module Converters
    class ShortCodeToId < Base
      def call
        symbols = from.split('').reverse
        position_value = 1
        id = symbols.reduce(0) do |result, symbol|
          result += ALPHABET.index(symbol) * position_value
          position_value *= ALPHABET.length
          result
        end
        id + 1
      end
    end
  end
end
