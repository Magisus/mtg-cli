require 'pry'
module MtgCli
  module DataFormatter
    module_function

    def reformat(json_data)
      reformatted_cards = {}
      json_data.each do |set, data|
        cards = parse_set(data)
        reformatted_cards.merge!(parse_set(data)) do |key, old_card, new_card|
          old_card.merge!(new_card) do |key, old_trait, new_trait|
            if(key == 'set_name' || key == 'set_code')
              old_trait.push(new_trait.first)
            elsif(key == 'multiverseid')
              old_trait = new_trait > old_trait ? new_trait : old_trait
            end
            old_trait
          end
        end
      end
      reformatted_cards.sort_by { |name, data| name }.to_h
    end

    def parse_set(set_hash)
      new_cards = {}
      set_hash['cards'].each do |card|
        snakeified_card = snakeify_hash(card)
        add_card(new_cards, snakeified_card)
        add_set_data(snakeified_card, set_hash)
      end
      new_cards
    end

    def add_card(new_cards, card)
      new_cards[card['name']] = card
    end

    def add_set_data(card, set_hash)
      card.delete('id')
      card['set_name'] = [set_hash['name']]
      card['set_code'] = [set_hash['code']]
      card
    end

    def snakeify_hash(hash)
      hash.map { |k, v| [snakeify(k), v] }.to_h
    end

    def snakeify(string)
      string.gsub(/::/, '/').
      gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
      gsub(/([a-z\d])([A-Z])/,'\1_\2').
      tr("-", "_").
      downcase
    end

    private_class_method :parse_set, :add_card, :add_set_data
  end
end
