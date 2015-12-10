module MtgCli
  class Cli
    FLAGS = %w(--gatherer)
    COMMANDS = %w(update)
    GATHERER = 'http://gatherer.wizards.com/Pages/Card/Details.aspx?multiverseid='

    def initialize(arg)
      @arg = arg
    end

    def run
      case command
      when 'update'
        #TODO run update
      else
        query(command, flags)
      end
    end

    private

    def query(command, flags)
      card = Card.find_by_name(command)
      visit_gatherer(card) if flags.include?('--gatherer')
      puts CardDisplay.new(card)
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
