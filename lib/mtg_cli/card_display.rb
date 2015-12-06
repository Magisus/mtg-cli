module MtgCli
  class CardDisplay

    def initialize(card)
      @card = card
      @traits = []
      card.traits.each { |trait| @traits.push(trait.to_sym) }
    end

    def render
      @traits.each do |trait|
        data = @card.send(trait)
        self.send(trait, data)
      end
    end

    def name(card_name)
      puts "Name: " + card_name
    end

    def type(card_type)
      puts "Type: " + card_type
    end

    def mana_cost(card_cost)
      puts 'Mana cost: ' + card_cost.tr('{}', '')
    end

  end
end
