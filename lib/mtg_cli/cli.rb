require 'pry'

module MtgCli
  class Cli
    def initialize(arg)
      @arg = arg
    end

    def run
      @data_directory = File.expand_path("../../../data", __FILE__)
      @data_file = @data_directory + "/card-data.json"
      puts @data_file
      if not File.exist? @data_directory
        Dir.mkdir @data_directory
        fetch_card_data
      elsif not File.exist?(@data_file)
        fetch_card_data
      end
    end

    def fetch_card_data
      tempfile = Downloader.new('http://mtgjson.com/json/AllSets.json').get
      file = File.new(@data_file, 'w')
      file.write(tempfile.read)
    end
  end
end
