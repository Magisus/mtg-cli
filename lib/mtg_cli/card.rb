module MtgCli
  class Card
    def self.find_by_name(name)
      card_data = JSONStore.instance.card_data
      name = FuzzyFinder.fuzzy_find(name, card_data.keys) if card_data[name.to_sym].nil?
      Card.new(*card_data[name.to_sym])
    end

    TRAITS = {
      name: '',
      mana_cost: '',
      cmc: 0,
      colors: [],
      type: '',
      supertypes: [],
      subtypes: [],
      rarity: '',
      text: '',
      flavor: '',
      artist: '',
      number: '',
      power: '',
      toughness: '',
      layout: '',
      multiverseid: 0,
      image_name: '',
      set_name: [],
      set_code: []
    }

    TRAITS.each do |k, _|
      define_method(k) { @traits[k] }
    end

    def initialize(*traits)
      traits = traits.to_h
      @traits = TRAITS.merge(traits)
    end

    def traits
      TRAITS.keys
    end

    def to_s
      @traits.to_s
    end
  end
end
