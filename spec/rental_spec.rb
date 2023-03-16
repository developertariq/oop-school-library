require_relative '../book'
require_relative '../student'
require_relative '../rental'

describe Rental do
  context 'test for Rental class' do
    date = '2023-03-15'
    book = Book.new('The love of my life', 'Rosie Walsh')
    person = Student.new(32, 'Tekhlay', parent_permission: true)
    rental = Rental.new(date, book, person)

    it 'if it is instance of class' do
      expect(rental).to be_an_instance_of(Rental)
    end

    it 'if it is book' do
      expect(rental.book).to eql(book)
    end

    it 'if it is person' do
      expect(rental.person).to eql(person)
    end

    it 'if it is correct name of renter' do
      expect(rental.person.name) == 'Tekhlay'
    end

    it 'if it is correct title of rented book' do
      expect(rental.book.title) == 'The love of my life'
    end
  end
end
