module MtgCli
  describe CardDisplay do

    let(:card) { Card.new(*{name: 'Putrefy', type: 'Instant', mana_cost: '{1}{B}{G}',
                            text: 'Destroy target artifact or creature. It can\'t be regenerated.'}
                         )}

    let(:display) { CardDisplay.new(card) }

    describe '#to_s' do
      it 'displays the card traits' do
        text = "\n\e[4mPutrefy                              1BG\e[0m\n\n" +
               "Instant\n\nDestroy target artifact or creature. It\n" +
               "can't be regenerated.\n\n\n\n"
        expect(display.to_s).to eq(text)
      end
    end

  end
end
