module MtgCli
  class Card
    attr_reader :name, :cost, :types, :rules_text, :multiverse_id, :color

    def initialize(name:, color:, cost:, types:, rules_text:, multiverse_id:)
      @name = name
      @color = color
      @cost = cost
      @types = types
      @rules_text = rules_text
      @multiverse_id = multiverse_id
    end
  end
end
