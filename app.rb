require_relative './person'
require_relative './book'
require_relative './rental'
require_relative './student'
require_relative './teacher'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def run
    puts "\e[32mWelcome to School Library App!\e[0m"
    loop do
      puts "\n\e[32mPlease choose an option by entering a number: \e[0m"
      puts '1. List all books'
      puts '2. List all people'
      puts '3. Create a person'
      puts '4. Create a book'
      puts '5. Create a rental'
      puts '6. List all rentals for a given person id'
      puts '7. Exit'

      input = gets.chomp.to_i
      
      run_option(input)
    end
  end

  private

  def run_option(input)
    @options = {
      1 => method(:list_books),
      2 => method(:list_people),
      3 => method(:create_person),
      4 => method(:create_book),
      5 => method(:create_rental),
      6 => method(:list_rentals_for_person),
      7 => method(:exit_app)
    }

    option = @options[input] 

    if option
      option.call
    else
      puts "\e[31mInvalid option. Please try again.\e[0m"
    end
  end

  def exit_app
    puts "\e[32mThank you for using this app!\e[0m"
    sleep(1)
    exit
  end

  def list_books
    if @books.empty?
      puts "\e[31mNo books in the library yet.\e[0m"
    else
      @books.each do |book|
        puts "\e[34mTitle: \"#{book.title}\", Author: #{book.author} \e[0m"
      end
    end
  end

  def list_people
    if @people.empty?
      puts "\e[31mNo people in the library yet.\e[0m"
    else
      @people.each do |person|
        puts "\e[34m[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age} \e[0m"
      end
    end
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '

    type = gets.chomp.to_i

    case type
    when 1
      create_student
    when 2
      create_teacher
    else
      puts "\e[31mInvalid input. Please try again.\e[0m"
    end
  end

  def create_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp.to_s
    print 'Has parent permission? [Y/N] '
    permission = gets.chomp.downcase == 'y'
    @people << Student.new(age, name, parent_permission: permission)
    puts 'Person created successfully.'
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp.to_s
    print 'Specialization: '
    specialization = gets.chomp.to_s
    @people << Teacher.new(age, name, specialization: specialization)
    puts 'Person created successfully.'
  end

  def create_book
    print 'Enter the title of the book: '
    title = gets.chomp

    print 'Enter the author of the book: '
    author = gets.chomp

    @books << Book.new(title, author)
    puts 'Book created successfully.'
  end

  def create_rental
    if @books.empty? || @people.empty?
      puts "\e[31mNo books or people in the library yet.\e[0m"
      return
    end

    book = select_book

    person = select_person

    if person && book
      print 'Date: '
      date = gets.chomp.to_s

      @rentals << Rental.new(date, book, person)
      puts 'Rental created successfully.'
    else
      puts "\e[31mInvalid person or book selected. Please try again.\e[0m"
    end
  end

  def select_book
    puts 'Select a book from the following list by number '
    @books.each_with_index do |book, index|
      puts "\e[34m#{index + 1}. Title: \"#{book.title}\", Author: #{book.author} \e[0m"
    end
    book_idx = gets.chomp.to_i - 1
    @books[book_idx]
  end

  def select_person
    puts 'Select a person from the following list by number (not id) '
    @people.each_with_index do |person, index|
      puts "\e[34m#{index + 1}. [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age} \e[0m"
    end
    person_idx = gets.chomp.to_i - 1
    @people[person_idx]
  end

  def list_rentals_for_person
    print 'ID of person: '
    person_id = gets.chomp.to_i

    rentals = @rentals.select { |r| r.person.id == person_id }

    if rentals.empty?
      puts "\e[31mNo rentals found for this person. Please try again.\e[0m"
    else
      puts 'Rentals: '
      rentals.each do |rental|
        puts "\e[34mDate: #{rental.date}, Book: \"#{rental.book.title}\" by #{rental.book.author}\e[0m"
      end
    end
  end
end
