class Router
  def initialize(meals_controller, customers_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @running = true
  end

  def run
    while @running
      action = display_options
      print `clear`
      route_action(action)
    end
  end

  def display_options
    puts '-' * 20
    puts 'Food Delivery'
    puts '-' * 20
    puts '1 - List meals'
    puts '2 - Create a meal'
    puts '3 - List customers'
    puts '4 - Create a customer'
    puts '0 - Exit'
    gets.chomp.to_i
  end

  def route_action(action)
    case action
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.list
    when 4 then @customers_controller.add
    when 0 then stop!
    else
      puts 'Invalid option'
    end
  end

  def stop!
    @running = false
  end
end
