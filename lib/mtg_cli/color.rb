module MtgCli
  module Color
    module_function

    COLOR_CODES = {
      red:   31,
      green: 32,
    }

    COLOR_CODES.each do |color, code|
      define_method(color.to_s) { |text| colorize(text, code) }
    end

    def colorize(text, code)
      "\e[#{code}m#{text}\e[0m"
    end

    private_constant :COLOR_CODES
    private_class_method :colorize
  end
end
