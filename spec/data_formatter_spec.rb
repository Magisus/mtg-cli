module MtgCli
  describe DataFormatter do

    describe '#reformat' do
      let(:data) {
        {
          'NMS' => {
            'name'  => 'Nemesis',
            'code'  => 'NMS',
            'cards' => [{'name' => 'Plains', 'type' => 'Land'},
                        {'name' => 'Forest', 'type' => 'Land'}]
            },
          'RTR' => {
            'name'  => 'Return to Ravnica',
            'code'  => 'RTR',
            'cards' => [{'name' => 'Forest', 'type' => 'Land', 'id' => '10'},
                        {'name' => 'Simic Charm', 'type' => 'Instant'}]
          }
        }
      }

      it 'should add set data to card data' do
        cards = DataFormatter.reformat(data)
        expect(cards['Forest']).to eq({'name' => 'Forest',
                                       'type' => 'Land',
                                       'setName' => ['Nemesis',
                                                     'Return to Ravnica'],
                                       'setCode' => ['NMS', 'RTR']})
        expect(cards['Forest']).not_to include('id')
      end

      it 'should sort data by card name' do
        cards = DataFormatter.reformat(data)
        expect(cards.keys).to eq ['Forest', 'Plains', 'Simic Charm']
      end
    end
  end
end
