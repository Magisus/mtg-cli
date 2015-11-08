require 'open-uri'

module MtgCli
  class Downloader
    attr_reader :path

    def initialize(path)
      @path = path
    end

    def get
      url = URI.parse(path)
      length = 0
      open(path, content_length_proc: -> (size) { length = size },
                 progress_proc:       -> (size) { puts size.fdiv(length) * 100 })
    end
  end
end
