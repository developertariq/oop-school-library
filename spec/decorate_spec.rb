require_relative '../nameable'
require_relative '../decorate'
require_relative '../person'

RSpec.describe Decorator do
  describe '#correct_name' do
    context 'Test for Decorator class' do
      let(:nameable) { double('nameable', correct_name: 'john smith') }
      let(:decorator) { Decorator.new(nameable) }

      it 'returns the correct name of the decorated object' do
        expect(decorator.correct_name).to eq('john smith')
      end
    end
  end
end
