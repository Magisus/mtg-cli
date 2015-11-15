module MtgCli
  class Cli
    def initialize(arg)
      @arg = arg
    end

    def run
      check_card_data
    end

    private

    def check_card_data
      data_directory = File.expand_path('../../../data', __FILE__)
      data_file = data_directory + '/card-data.json'
      if !File.exist?(data_directory)
        Dir.mkdir(data_directory)
        fetch_card_data(data_file)
      elsif !File.exist?(data_file)
        fetch_card_data(data_file)
      else
        puts 'Card data present; no download required'
      end
    end

    def fetch_card_data(destination)
      tempfile = Downloader.get('http://mtgjson.com/json/AllSets.json')
      file = File.new(destination, 'w')
      file.write(tempfile.read)
    end
  end
end
