class Reverser
  def initialize(argv)
    @input = argv
  end

  def run
    for s in @input do
      puts s.reverse
    end
  end
end
