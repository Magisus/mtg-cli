module MtgCli
  describe Card do
    describe '.new' do
      context 'zero arguments' do
        let(:card) { Card.new }

        it 'responds with card trait defaults' do
          %i(name mana_cost type rarity text flavor artist number power
             toughness layout image_name).each do |trait|
            expect(card.send(trait)).to eq ''
          end
          %i(colors supertypes subtypes).each do |trait|
            expect(card.send(trait)).to eq []
          end
          %i(cmc multiverseid).each do |trait|
            expect(card.send(trait)).to eq 0
          end
        end
      end

      context 'some arguments' do
        let(:args) { {name: 'Example', colors: ['White', 'Black'] } }
        let(:card) { Card.new(*args) }

        it 'responds with card traits' do
          expect(card.name).to eq args[:name]
          expect(card.colors).to eq args[:colors]
        end
      end
    end

    describe '.find_by_name' do
      # TODO test the messages sent to JSONStore
    end

    describe 'query methods' do
      let(:card) { Card.new }

      it 'responds to trait messages' do
        Card::TRAITS.each do |k ,_|
          expect(card).to respond_to(k)
        end
      end
    end
  end
end
