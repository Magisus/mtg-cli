module MtgCli
  class Cli
    FLAGS = %w(--gatherer, --verbose)
    GATHERER = 'http://gatherer.wizards.com/Pages/Card/Details.aspx?multiverseid='

    def initialize(arg)
      @arg = arg
    end

    def run
      query(command, flags)
    end

    private

    def query(command, flags)
      card = Card.find_by_name(command)
      visit_gatherer(card) if flags.include?('--gatherer')
      if flags.include?('--verbose')
        puts CardDisplay.new(card).verbose()
      else
        puts CardDisplay.new(card)
      end
    end

    def visit_gatherer(card)
      `open #{GATHERER + card.multiverseid.to_s}`
    end

    def command
      @command ||= @arg.reject { |arg| flag?(arg) }.join(' ')
    end

    def flags
      @flags ||= @arg.select { |arg| flag?(arg) }
    end

    def flag?(arg)
      arg.start_with?('--')
    end
  end
end
