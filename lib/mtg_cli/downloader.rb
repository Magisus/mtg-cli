require 'open-uri'
require 'io/console'
require_relative './text_effects'

module MtgCli
  module Downloader
    extend TextEffects

    module_function

    def get(path)
      puts green('Downloading...')
      file = download_file(path)
      puts green('Done!')
      file
    end

    def download_file(path)
      progress_bar = nil
      open(
        path,
        content_length_proc: lambda do |length|
          progress_bar = ProgressBar.new(
            window_size: IO.console.winsize[1],
            total: length
          )
        end,
        progress_proc: lambda do |progress|
          progress_bar.update(progress)
        end
      )
    rescue SocketError
      abort red('Error! Unable to establish connection.')
    rescue StandardError
      abort red('Error! Unable to download data.')
    end

    private_class_method :download_file
  end
end
