require 'json'
require 'singleton'

module MtgCli
  class JSONStore
    include Singleton

    DATA_DIR = File.expand_path('../../../data', __FILE__)
    JSON_PATH = DATA_DIR + '/card-data.json'
    JSON_SOURCE = 'http://mtgjson.com/json/AllSets.json'

    attr_reader :card_data

    def initialize
      check_json_store
      @card_data = read(JSON_PATH)
    end

    private

    def read(path)
      File.open(path, 'r:UTF-8') { |f| JSON.parse(f.read) }
    end

    def write(path, data)
      File.open(path, 'a:UTF-8') { |f| f << JSON.generate(data) }
    end

    def fetch(source)
      data = Downloader.get(source).read
      block_given? ? yield(data) : data
    end

    def format(data)
      json = JSON.parse(data)
      DataFormatter.reformat(json)
    end

    def check_json_store
      return if File.exist?(JSON_PATH)
      Dir.mkdir(DATA_DIR) unless File.exist?(DATA_DIR)
      json = fetch(JSON_SOURCE) { |data| format(data) }
      write(JSON_PATH, json)
    end
  end
end
