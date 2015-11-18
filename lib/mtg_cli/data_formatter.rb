module MtgCli
  module DataFormatter
    module_function

    def reformat(json_data)
      reformatted_cards = {}
      json_data.each do |set, data|
        cards = parse_set(data)
        reformatted_cards.merge!(parse_set(data)) do |key, old_card, new_card|
          old_card['setName'].push(new_card['setName'].first)
          old_card['setCode'].push(new_card['setCode'].first)
          old_card
        end
      end
      reformatted_cards.sort_by { |name, data| name }.to_h
    end

    def parse_set(set_hash)
      new_cards = {}
      set_hash['cards'].each do |card_hash|
        new_cards[card_hash['name']] = card_hash
        card = new_cards[card_hash['name']]
        card.delete('id')
        card['setName'] = [set_hash['name']]
        card['setCode'] = [set_hash['code']]
      end
      new_cards
    end

    private_class_method :parse_set
  end
end
