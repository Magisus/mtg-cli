module MtgCli
  class Color
    attr_reader :colors

    def initialize(*colors)
      @colors = colors
    end

    COLORS = [
      :white,
      :blue,
      :black,
      :red,
      :green
    ]

    def to_s
      case colors.size
      when 0
        ''
      when 1
        "Color: #{colors.first}"
      else
        "Colors: #{colors.join(', ')}"
      end
    end
  end
end
