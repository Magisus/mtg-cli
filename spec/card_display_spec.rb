module MtgCli
  describe CardDisplay do

    let(:card) { Card.new(* {name: 'Putrefy',
                            type: 'Instant',
                            mana_cost: '{1}{B}{G}',
                            text: 'Destroy target artifact or creature. It can\'t be regenerated.',
                            artist: 'Richard Sardinha',
                            flavor: "\"All matter, animate or not, rots when " +
                                    "exposed to time. We merely speed up the process.\"\n" +
                                    "—Ezoc, Golgari rot farmer",
                            rarity: 'Rare',
                            set_name: ['Dragon\'s Maze', 'Commander 2015'] }
                         )}

    let(:display) { CardDisplay.new(card) }

    describe '#to_s' do
      context 'standard' do
        it 'displays the card traits' do
          text = <<-CARD

\e[4mPutrefy                              1BG\e[0m

Instant

Destroy target artifact or creature. It
can't be regenerated.
CARD
          expect(display.to_string).to eq text
        end
      end

      context 'verbose' do
        it 'displays additional card info' do
          text = <<-CARD

\e[4mPutrefy                              1BG\e[0m

Instant

Destroy target artifact or creature. It
can\'t be regenerated.

\e[3m"All matter, animate or not, rots when
exposed to time. We merely speed up the
process."
—Ezoc, Golgari rot farmer\e[0m

Artist: Richard Sardinha
Rarity: Rare
Sets: Dragon's Maze, Commander 2015
CARD
          expect(display.to_string(verbose: true)).to eq text
        end
      end
    end
  end
end
