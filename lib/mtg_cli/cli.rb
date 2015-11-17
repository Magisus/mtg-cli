module MtgCli
  class Cli
    attr_reader :arg

    DATA_DIRECTORY = File.expand_path('../../../data', __FILE__)
    DATA_SOURCE    = 'http://mtgjson.com/json/AllSets.json'

    def initialize(arg)
      @arg = arg
    end

    def run
      check_card_data
   end

    private

    def check_card_data
      data_file = DATA_DIRECTORY + '/card-data.json'
      return if File.exists? data_file
      Dir.mkdir(DATA_DIRECTORY) unless File.exists? DATA_DIRECTORY
      fetch_card_data(data_file)
    end

    def fetch_card_data(destination)
      tempfile = Downloader.get(DATA_SOURCE)
      file = File.new(destination, 'w')
      file.write(tempfile.read)
    end
  end
end
