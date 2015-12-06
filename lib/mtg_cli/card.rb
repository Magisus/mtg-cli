module MtgCli
  class Card
    def self.find_by_name(name)
      card_data = JSONStore.instance.card_data[name]
      Card.new(*card_data)
    end

    def initialize(*traits)
      @traits = traits.to_h
    end

    def to_s
      @traits.to_s
    end

    def traits
      @traits.keys
    end

    def method_missing(method_name, *arguments, &block)
      if @traits.include?(method_name.to_s)
        @traits[method_name.to_s]
      else
        super
      end
    end

    def respond_to_missing?(method_name, include_private = false)
      @traits.include?(method_name.to_s) || super
    end
  end
end
