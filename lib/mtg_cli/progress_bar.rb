module MtgCli
  class ProgressBar
    attr_reader :window_size, :total, :steps

    def initialize(window_size:, total:)
      @window_size = window_size
      @total       = total
      @steps       = 0
      puts 'Downloading...'
    end

    def update(progress)
      new_steps(progress).times do |n|
        print '#'
        @steps += 1
      end
    end

    private

    def as_steps(progress)
      (progress.fdiv(total) * window_size).round
    end

    def new_steps(progress)
      as_steps(progress) - steps
    end
  end
end
