module MtgCli
  class ProgressBar
    attr_reader :window_size, :total, :steps

    def initialize(window_size:, total:)
      validate_greater_than(:window_size, 1, window_size)
      validate_greater_than(:total, 0, total)

      @window_size = window_size
      @total = total
      @steps = 0
    end

    def update(progress)
      validate_less_than(:progress, total, progress)

      new_steps = as_steps(progress) - @steps
      print '#' * new_steps
      @steps += new_steps
    end

    private

    def as_steps(progress)
      (progress.fdiv(total) * window_size).round
    end

    def validate_greater_than(attribute, expected, value)
      return if value > expected
      attribute = attribute.to_s.tr('_', ' ').capitalize!
      fail ArgumentError, "#{attribute} must be greater than #{expected}."
    end

    def validate_less_than(attribute, expected, value)
      return if expected >= value
      attribute = attribute.to_s.tr('_', ' ').capitalize!
      fail ArgumentError, "#{attribute} must be less than #{expected}."
    end
  end
end
