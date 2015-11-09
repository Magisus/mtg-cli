module MtgCli
  describe ProgressBar do

    describe '#new' do
      context 'error handling' do
        it 'raises an error if window size is less than 1' do
          expect {
            ProgressBar.new(window_size: 0, total: 1000)
          }.to raise_error ArgumentError, 'Window size cannot be less than 1.'
        end

        it 'raises an error if total is less than 1' do
          expect {
            ProgressBar.new(window_size: 80, total: 0)
          }.to raise_error ArgumentError, 'Total cannot be less than 1.'
        end
      end
    end

    describe '#update' do
      let(:pb) { ProgressBar.new(window_size: 80, total: 1000) }

      it 'updates progress and prints new steps to standard output' do
        expect { pb.update(12) }.to output('#').to_stdout
        expect(pb.steps).to eq 1
        expect { pb.update(24) }.to output('#').to_stdout
        expect(pb.steps).to eq 2
        expect { pb.update(120) }.to output('#' * 8).to_stdout
        expect(pb.steps).to eq 10
      end

      it 'rounds data chunks' do
        expect { pb.update(5) }.not_to output.to_stdout
        expect(pb.steps).to eq 0
        expect { pb.update(23) }.to output('##').to_stdout
        expect(pb.steps).to eq 2
      end

      context 'error handling' do
        it 'raises an error if progress exceeds total' do
          expect {
            pb.update(1200)
          }.to raise_error ArgumentError, 'Progress cannot be greater than total.'
        end
      end
    end

    context 'public api' do
      it 'only exposes update and input query methods' do
        expect(
          ProgressBar.constants + ProgressBar.instance_methods - Object.methods
        ).to eq %i(window_size total steps update)
      end
    end
  end
end
