module MtgCli
  describe CardDisplay do

    let(:card) { Card.new(*{'name' => 'Putrefy', 'type' => 'instant', 'mana_cost' => '{1}{B}{G}'})}

    let(:display) { CardDisplay.new(card) }

    describe '#render' do
      it 'displays the card traits' do
        expect{ display.render }.to output("Name: Putrefy\n" +
                                           "Type: instant\n" +
                                           "Mana cost: 1BG\n").to_stdout
      end
    end

  end
end
