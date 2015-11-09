module MtgCli
  class ProgressBar
    attr_reader :window_size, :total, :steps

    def initialize(window_size:, total:)
      if window_size < 1
        fail ArgumentError, 'Window size cannot be less than 1.'
      end
      if total < 1
        fail ArgumentError, 'Total cannot be less than 1.'
      end

      @window_size = window_size
      @total = total
      @steps = 0
    end

    def update(progress)
      if progress > @total
        fail ArgumentError, 'Progress cannot be greater than total.'
      end

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
