require_relative 'app'

class Main
  def start
    app = SchoolLibraryApp.new
    puts 'Welcome to the School Library App!'
    app.run
  end
end

main = Main.new
main.start
