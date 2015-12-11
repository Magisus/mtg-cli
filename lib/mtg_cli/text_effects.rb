module MtgCli
  module TextEffects
    module_function

    COLOR_CODES = {
      red:     31,
      green:   32,
      yellow:  33,
      blue:    34,
      magenta: 35
    }

    EFFECT_CODES = {
      bold:      1,
      italic:    3,
      underline: 4,
      inverse:   7
    }

    COLOR_CODES.each do |color, code|
      define_method(color.to_s) { |text| colorize(text, code) }
    end

    EFFECT_CODES.each do |effect, code|
      define_method(effect.to_s) { |text| add_effect(text, code) }
    end

    def add_effect(text, code)
      "\e[#{code}m#{text}\e[0m"
    end

    def colorize(text, code)
      # TODO figure out if there's an escape sequence that only cancels color
      # The one I found doesn't work on windows
      "\e[#{code}m#{text}\e[0m"
    end

    private_constant :EFFECT_CODES, :COLOR_CODES
    private_class_method :add_effect, :colorize
  end
end
