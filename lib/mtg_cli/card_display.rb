module MtgCli
  class CardDisplay
    LINE_COLUMNS = 40

    attr_reader :card

    def initialize(card)
      @card = card
      @traits = card.traits.map(&:to_sym)
    end

    def to_s(verbose: false)
      card_string = header(card.name, card.mana_cost)
      card_string << type(card.type)
      card_string << rules_text(card.text)
      card_string << flavor(card.flavor) if verbose
      card_string << pt(card.power, card.toughness)
      card_string << additional_data if verbose
      card_string
    end

    private

    def wrap(text)
      text.gsub(/(.{1,#{LINE_COLUMNS}})(\s+|\z)/, "\\1\n").chomp("\n")
    end

    def header(name, cost)
      cost = cost.tr('{}', '')
      spaces = ' ' * (LINE_COLUMNS - (name.size + cost.size))
      underlined = TextEffects.underline("#{name}#{spaces}#{cost}")
      "\n#{underlined}\n"
    end

    def type(card_type)
      "\n#{card_type}\n"
    end

    def rules_text(text)
      "\n#{wrap(text)}\n"
    end

    def flavor(flavor_text)
      "\n#{TextEffects.italic(wrap(card.flavor))}\n"
    end

    def pt(power, toughness)
      return '' if power.empty? && toughness.empty?
      pt = "(#{power}/#{toughness})"
      spaces = ' ' * (LINE_COLUMNS - pt.size)
      "\n#{spaces}#{pt}\n"
    end

    def additional_data
<<-CARD

Artist: #{card.artist}
Rarity: #{card.rarity}
Sets: #{card.set_name.join(', ')}
CARD
    end
  end
end
