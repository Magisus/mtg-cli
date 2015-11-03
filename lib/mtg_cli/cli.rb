require 'pry'

module MtgCli
  class Cli
    def initialize(arg)
      @arg = arg
    end

    def run
      file = Downloader.new('http://mtgjson.com/json/AllSets.json').get
      binding.pry
    end
  end
end
