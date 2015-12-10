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
      "\e[4m#{name}#{spaces}#{cost}\e[0m"
    end

    def pt(power, toughness)
      return '' if power.empty? && toughness.empty?
      pt = "(#{power}/#{toughness})"
      spaces = ' ' * (LINE_COLUMNS - pt.size)
      "#{spaces}#{pt}"
    end
  end
end
