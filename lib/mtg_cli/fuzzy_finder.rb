module MtgCli
  module FuzzyFinder
    def self.distance(a, b)
      m, n = a.length, b.length

      return m if n == 0
      return n if m == 0

      d = Array.new(m + 1) { Array.new(n + 1) }

      (0..m).each { |i| d[i][0] = i }
      (0..n).each { |j| d[0][j] = j }

      (1..n).each do |j|
        (1..m).each do |i|
          d[i][j] = prefix_operation(a, b, d, i, j)
        end
      end

      d[m][n]
    end

    private

    def self.prefix_operation(a, b, d, i, j)
      return d[i - 1][j - 1] if a[i - 1] == b[j - 1]

      del = d[i - 1][j] + 1
      ins = d[i][j - 1] + 1
      sub = d[i - 1][j - 1] + 1
      [del, ins, sub].min
    end
  end
end
