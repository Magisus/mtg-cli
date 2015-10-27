module StringReverser
  describe Reverser do

    let(:strings) { %w[hello goodbye] }

    describe '#each' do
      it 'reverses each argument' do
        expect(Reverser.reverse(strings)).to eq %w[olleh eybdoog]
      end
    end
  end
end
