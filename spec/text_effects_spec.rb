module MtgCli
  describe TextEffects do

    describe '.red' do
      it 'colors the text red' do
        expect(TextEffects.red('test')).to eq "\e[31mtest\e[0m"
      end
    end

    describe '.green' do
      it 'colors the text green' do
        expect(TextEffects.green('test')).to eq "\e[32mtest\e[0m"
      end
    end

    describe '.yellow' do
      it 'colors the text yellow' do
        expect(TextEffects.yellow('test')).to eq "\e[33mtest\e[0m"
      end
    end

    describe '.blue' do
      it 'colors the text blue' do
        expect(TextEffects.blue('test')).to eq "\e[34mtest\e[0m"
      end
    end

    describe '.underline' do
      it 'underlines the text' do
        expect(TextEffects.underline('test')).to eq "\e[4mtest\e[0m"
      end
    end

    context 'public api' do
      it 'only exposes color methods' do
        expect(
          TextEffects.constants + TextEffects.methods - Object.methods
        ).to eq %i(red green yellow blue magenta bold italic underline inverse)
      end
    end
  end
end
