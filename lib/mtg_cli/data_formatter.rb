module MtgCli
  module DataFormatter
    module_function

    def reformat(json_data)
      reformatted_cards = {}
      json_data.each do |set, data|
        cards = parse_set(data)
        reformatted_cards.merge!(parse_set(data)) do |_, old_card, new_card|
          merge_set_data(old_card, new_card)
        end
      end
      reformatted_cards.sort_by { |name, data| name }.to_h
    end

    def merge_set_data(old_card, new_card)
      old_card.merge(new_card) do |key, old_trait, new_trait|
        if(key == 'set_name' || key == 'set_code')
          add_new_set(old_trait, new_trait)
        elsif(key == 'multiverseid')
          use_most_recent_id(old_trait, new_trait)
        else
          old_trait
        end
      end
    end

    def add_new_set(old_set_list, new_set_list)
      old_set_list.push(new_set_list.first)
    end

    def use_most_recent_id(old_id, new_id)
      new_id > old_id ? new_id : old_id
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

    private_class_method :parse_set, :add_card, :add_set_data, :add_new_set, :use_most_recent_id,
                         :merge_set_data, :snakeify, :snakeify_hash
  end
end
