require_relative 'app'
require_relative 'menu'

def main
  app = App.new
  menu = Menu.new

  puts "\e[32mWelcome to School Library App!\e[0m"
  loop do
    menu.show_menu

    input = gets.chomp.to_i
    exit_app if input == 7
    app.run_command(input)
    puts "\e[31mInvalid option. Please try again.\e[0m" if input < 1 || input > 7
  end
end

def exit_app()
  puts "\e[32mThank you for using this app!\e[0m"
  exit
end

main
