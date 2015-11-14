module MtgCli
  describe Color do

    describe '#to_s' do
      context 'colorless' do
        it 'returns the empty string' do
          expect(Color.new.to_s).to eq ''
        end
      end

      context 'one color' do
        it 'does not pluralize Color' do
          expect(Color.new(:red).to_s).to eq 'Color: red'
        end
      end

      context 'multiple colors' do
        it 'pluraizes Color' do
          expect(Color.new(:red, :green).to_s).to eq 'Colors: red, green'
        end
      end
    end

    context 'public api' do
      it 'only exposes colors query and ordered colors array' do
        expect(
          Color.constants + Color.instance_methods - Object.methods
        ).to eq %i(COLORS colors)
      end
    end
  end
end
