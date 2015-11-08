module MtgCli
  class ProgressBar
    attr_reader :window_size, :total

    def initialize(window_size:, total:)
      @window_size = window_size
      @total       = total
      @steps       = 0
    end

    def update(progress)
      new_steps = as_steps(progress) - @steps
      print '#' * new_steps
      @steps += new_steps
    end

    private

    def as_steps(progress)
      (progress.fdiv(total) * window_size).round
    end
  end
end
