module MtgCli
  class Type

    attr_reader :types

    def initialize(*types)
      @types = ORDERED_TYPES.select { |type| types.include? type }
    end

    ORDERED_TYPES = [
      :legendary,
      :tribal,
      :basic,
      :snow,
      :world,
      :enchantment,
      :artifact,
      :land,
      :creature,
      :sorcery,
      :instant,
      :planeswalker,
      :ongoing,
      :scheme,
      :phenomenon,
      :plane,
      :vanguard,
      :conspiracy,
      :plane
    ]

    def to_s
      "Type: #{types.map(&:capitalize).join(' ')}"
    end
  end
end
