module MtgCli
  class CardDisplay
    LINE_COLUMNS = 40

    attr_reader :card

    def initialize(card)
      @card = card
      @traits = card.traits.map(&:to_sym)
    end

    def to_s
<<-CARD

#{header(card.name, card.mana_cost)}

#{card.type}

#{wrap(card.text)}

#{pt(card.power, card.toughness)}
CARD
    end

    private

    def wrap(text)
      text.gsub(/(.{1,40})(\s+|\z)/, "\\1\n")
    end

    def header(name, cost)
      cost = cost.tr('{}', '')
      spaces = ' ' * (LINE_COLUMNS - (name.size + cost.size))
      TextEffects.underline("#{name}#{spaces}#{cost}")
    end

    #This works, but I think it looks bad. We can rethink
    def colorize_mana_cost(cost)
      colored_cost = ""
      cost.each_char do |c|
        if c == "U"
          colored_cost += TextEffects.blue(c)
        elsif c == "B"
          colored_cost += TextEffects.magenta(c)
        elsif c == "R"
          colored_cost += TextEffects.red(c)
        elsif c == "G"
          colored_cost += TextEffects.green(c)
        else
          colored_cost += c
        end
      end
      colored_cost
    end

    def pt(power, toughness)
      return '' if power.empty? && toughness.empty?
      pt = "(#{power}/#{toughness})"
      spaces = ' ' * (LINE_COLUMNS - pt.size)
      "#{spaces}#{pt}"
    end
  end
end
