class Router
  def initialize(meals_controller, customers_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
  end

  def run
    puts "Welcome to Food Delivery App"
    loop do
      print_actions
      action = gets.chomp.to_i
      dispatch(action)
    end
  end

  private

  def print_actions
    puts "What do you want to do next?"
    puts "1 - Create a new meal"
    puts "2 - List all meals"
    puts "3 - Create a new customer"
    puts "4 - List all customers"
    puts "0 - Exit"
  end

  def dispatch(action)
    case action
    when 1
      @meals_controller.add
    when 2
      @meals_controller.list
    when 3
      @customers_controller.add
    when 4
      @customers_controller.list
    when 0
      puts "Goodbye!"
      exit
    else
      puts "Please choose a valid option"
    end
  end
end