module MtgCli
  module FuzzyFinder
    def self.levenshtein(a, b)
      case
      when a.empty?
        b.length
      when b.empty?
        a.length
      else
        [(a[0] == b[0] ? 0 : 1) + levenshtein(a[1..-1], b[1..-1]),
         1 + levenshtein(a[1..-1], b),
         1 + levenshtein(a, b[1..-1])].min
      end
    end
  end
end
