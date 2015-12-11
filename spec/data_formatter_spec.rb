module MtgCli
  describe DataFormatter do

    describe '#reformat' do
      let(:data) {
        {
          'NMS' => {
            'name'  => 'Nemesis',
            'code'  => 'NMS',
            'cards' => [{'name' => 'Plains', 'type' => 'Land', 'multiverseid' => '2'},
                        {'name' => 'Forest', 'type' => 'Land', 'multiverseid' => '5'}]
            },
          'RTR' => {
            'name'  => 'Return to Ravnica',
            'code'  => 'RTR',
            'cards' => [{'name' => 'Forest', 'type' => 'Land', 'id' => '10', 'multiverseid' => '2'},
                        {'name' => 'Simic Charm', 'type' => 'Instant'},
                        {'name' => 'Plains'}]
          }
        }
      }

      it 'adds set data to card data and removes id field' do
        cards = DataFormatter.reformat(data)
        expect(cards['Forest']).to eq({'name' => 'Forest',
                                       'type' => 'Land',
                                       'multiverseid' => '5',
                                       'set_name' => ['Nemesis',
                                                     'Return to Ravnica'],
                                       'set_code' => ['NMS', 'RTR']})
        expect(cards['Forest']).not_to include('id')
      end

      it 'correctly saves only the largest multiverse id' do
        cards = DataFormatter.reformat(data)
        expect(cards['Forest']['multiverseid']).to eq('5')
        expect(cards['Plains']['multiverseid']).to eq('2')
      end

      it 'sorts data by card name' do
        cards = DataFormatter.reformat(data)
        expect(cards.keys).to eq ['Forest', 'Plains', 'Simic Charm']
      end
    end

    context 'public api' do
      it 'only exposes reformat method' do
        expect(
          DataFormatter.constants + DataFormatter.methods - Object.methods
        ).to eq %i(reformat)
      end
    end
  end
end
