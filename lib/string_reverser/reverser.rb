module StringReverser
  module Reverser
    def self.reverse(strings)
      strings.map(&:reverse)
    end
  end
end
