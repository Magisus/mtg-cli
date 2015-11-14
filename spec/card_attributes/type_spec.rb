module MtgCli
  describe Type do

    describe '#to_s' do
      context 'with legendary' do
        it 'puts legendary first' do
          expect(
            Type.new(:creature, :legendary).to_s
          ).to eq 'Type: Legendary Creature'
        end

        context 'multiple permanent types' do
          it 'correctly orders permanent types' do
            expect(
              Type.new(:creature, :artifact, :land, :enchantment).to_s
            ). to eq 'Type: Enchantment Artifact Land Creature'
          end
        end

        context 'obscure types' do
          it 'treats snow and world as modifiers' do
            expect(
              Type.new(:land, :snow, :basic).to_s
            ).to eq 'Type: Basic Snow Land'

            expect(
              Type.new(:enchantment, :world).to_s
            ).to eq 'Type: World Enchantment'
          end
        end
      end

      context 'public api' do
        it 'only exposes types query and ordered types array' do
          expect(
            Type.constants + Type.instance_methods - Object.methods
          ).to eq %i(ORDERED_TYPES types)
        end
      end
    end
  end
end
