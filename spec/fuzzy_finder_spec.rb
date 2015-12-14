require 'pry'
module MtgCli
  describe FuzzyFinder do

    describe '.distance' do
      it 'calculates edit distance' do
        examples = [
          ['Jace, the Mind Sculptor', 'Jace the Mindsculptor', 3],
          ['Lightning Blast', 'Lightning Bolt', 3]
        ]
        examples.each do |(a, b, distance)|
          expect(FuzzyFinder.distance(a, b)).to eq distance
        end
      end
    end
  end
end
