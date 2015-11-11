module MtgCli
  describe Color do

    describe '.red' do
      it 'colors the text red' do
        expect(Color.red('test')).to eq "\e[31mtest\e[0m"
      end
    end

    describe '.green' do
      it 'colors the text green' do
        expect(Color.green('test')).to eq "\e[32mtest\e[0m"
      end
    end

    describe '.yellow' do
      it 'colors the text yellow' do
        expect(Color.yellow('test')).to eq "\e[33mtest\e[0m"
      end
    end

    describe '.blue' do
      it 'colors the text blue' do
        expect(Color.blue('test')).to eq "\e[34mtest\e[0m"
      end
    end

    context 'public api' do
      it 'only exposes color methods' do
        expect(
          Color.constants + Color.methods - Object.methods
        ).to eq %i(red green yellow blue)
      end
    end
  end
end
