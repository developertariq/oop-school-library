require_relative '../book'

describe Book do
  context 'Test for Book class' do
    before(:context) do
      title = 'The love of my life'
      author = 'Rosie Walsh'
      @book = Book.new(title, author)
    end

    it 'if it is instance of a class' do
      expect(@book).to be_an_instance_of(Book)
    end

    it 'if book title is The love of my life' do
      expect(@book.title).to eq('The love of my life')
    end

    it 'if book author is Rosie Walsh' do
      expect(@book.author).to eq('Rosie Walsh')
    end
  end
end
