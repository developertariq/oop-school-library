require_relative '../trimmer'

RSpec.describe TrimmerDecorator do
  describe '#correct_name' do
    let(:nameable) { double('nameable', correct_name: 'John Smith') }
    let(:decorator) { TrimmerDecorator.new(nameable) }

    it 'returns the full name when it is shorter than the maximum length' do
      expect(decorator.correct_name).to eq('John Smith')
    end

    it 'returns a truncated name when it is longer than the maximum length' do
      nameable = double('nameable', correct_name: 'Elizabeth Johnson')
      decorator = TrimmerDecorator.new(nameable)
      expect(decorator.correct_name).to eq('Elizabeth ')
    end

    it 'returns an empty string when the decorated object returns an empty string' do
      nameable = double('nameable', correct_name: '')
      decorator = TrimmerDecorator.new(nameable)
      expect(decorator.correct_name).to eq('')
    end
  end
end
