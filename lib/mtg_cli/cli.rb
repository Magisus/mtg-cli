module MtgCli
  class Cli
    def initialize(arg)
      @arg = arg
    end

    def run
      #TODO parse arguments and display correct Card
    end

    private

    def arguments
      card_name = ''
      flags = []
      @arg.each do |a|
        if a.start_with?('--')
          flags << a
        else
          card_name << " #{a}"
        end
      end
      {card_name: card_name, flags: flags}
    end
  end
end
