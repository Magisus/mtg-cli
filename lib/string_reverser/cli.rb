module StringReverser
  class Cli
    def initialize(argv)
      @input = argv
    end

    def run
      puts Reverser.reverse(@input)
    end
  end
end
