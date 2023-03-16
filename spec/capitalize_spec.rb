require_relative '../capitalize'

RSpec.describe CapitalizeDecorator do
  describe '#correct_name' do
    let(:nameable) { double('nameable', correct_name: 'john smith') }
    let(:decorator) { CapitalizeDecorator.new(nameable) }

    it 'capitalizes the first letter of the name' do
      expect(decorator.correct_name).to eq('John smith')
    end

    it 'does not modify names that are already capitalized' do
      nameable = double('nameable', correct_name: 'John smith')
      decorator = CapitalizeDecorator.new(nameable)
      expect(decorator.correct_name).to eq('John smith')
    end

    it 'returns an empty string when the decorated object returns an empty string' do
      nameable = double('nameable', correct_name: '')
      decorator = CapitalizeDecorator.new(nameable)
      expect(decorator.correct_name).to eq('')
    end
  end
end
