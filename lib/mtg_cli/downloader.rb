require 'open-uri'
require 'io/console'

module MtgCli
  module Downloader
    extend Colors

    module_function

    def get(path)
      puts green('Downloading...')
      file = download_file(path)
      puts green('Done!')
      file
    end

    def download_file(path)
      begin
        progress_bar = nil
        open(path,
          content_length_proc: -> (length) {
            progress_bar = ProgressBar.new(
              window_size: IO.console.winsize[1],
              total: length
            )
          },
          progress_proc: -> (progress) { progress_bar.update(progress) }
        )
      rescue SocketError
        abort red('Error! Unable to establish connection.')
      rescue StandardError
        abort red('Error! Unable to download data.')
      end
    end

    private_class_method :download_file
  end
end
