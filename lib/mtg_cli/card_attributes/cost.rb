module MtgCli
  class Cost
    attr_reader :cost, :cmc

    def initialize(*cost)
      @cost = cost
      @cmc = calculate_cmc(cost)
    end

    COST = [
      :W,  :U,  :B,  :R,  :G,
      :WU, :UB, :BR, :RG, :GW,
      :WB, :BR, :BG, :RW, :GB,
      :W2, :U2, :B2, :R2, :G2,
      :PW, :PU, :PB, :PR, :PG,
      :S,  :X
    ]

    CMC = {
      W2: 2,
      U2: 2,
      B2: 2,
      R2: 2,
      G2: 2,
      X:  0
    }

    private

    def calculate_cmc(cost)
      cost.inject { |sum, c| sum += CMC.include?(c) ? CMC[c] : 1 }
    end
  end
end
