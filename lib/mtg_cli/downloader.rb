require 'open-uri'
require 'io/console'

module MtgCli
  class Downloader
    attr_reader :path

    def initialize(path:)
      @path = path
    end

    def get
      puts 'Downloading...'
      open(
        path,

        content_length_proc: -> (length) {
          @progress_bar = ProgressBar.new(
            window_size: IO.console.winsize[1],
            total: length
          )
        },

        progress_proc: -> (progress) {
          @progress_bar.update(progress)
        }
      )
    end
  end
end
