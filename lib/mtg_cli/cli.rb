module MtgCli
  class Cli
    def initialize(arg)
      @arg = arg
    end

    def run
      puts @arg
    end
  end
end
