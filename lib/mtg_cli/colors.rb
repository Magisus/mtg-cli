module MtgCli
  module Colors
    module_function

    COLOR_CODES = {
      red:   31,
      green: 32,
    }

    COLOR_CODES.each do |color, code|
      define_method(color.to_s) { |string| colorize(string, code) }
    end

    def colorize(string, color_code)
      "\e[#{color_code}m#{string}\e[0m"
    end

    private_class_method :colorize
  end
end
