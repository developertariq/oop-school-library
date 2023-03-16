require_relative '../nameable'
require_relative '../person'

describe Nameable do
  context 'Test for Nameable class' do
    person = Person.new(32, 'carroluslinious')
    person.correct_name
    capitalized_person = CapitalizeDecorator.new(person)
    capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)

    it 'if nameable function will ensure initial cap of name' do
      expect(capitalized_person.correct_name).to eql('Carroluslinious')
    end
    it 'if nameable function trim name and ensure max length of name is 10' do
      expect(capitalized_trimmed_person.correct_name).to eql('Carrolusli')
    end
  end
end
