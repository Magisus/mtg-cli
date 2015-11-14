module MtgCli
  class Card
    attr_reader :name, :cost, :types, :rules_text, :multiverse_id

    def initialize(name:, cost:, types:, rules_text:, multiverse_id:)
      @name = name
      @cost = cost
      @types = types
      @rules_text = rules_text
      @multiverse_id = multiverse_id
    end

    TYPES = [
      :artifact,
      :basic,
      :conspiracy,
      :creature,
      :enchantment,
      :instant,
      :land,
      :legendary,
      :ongoing,
      :phenomenon,
      :plane,
      :planeswalker,
      :scheme,
      :snow,
      :sorcery,
      :tribal,
      :vanguard,
      :word
    ]

    TYPES.each do |type|
      define_method("#{type}?") { types.include? type }
    end
  end
end
