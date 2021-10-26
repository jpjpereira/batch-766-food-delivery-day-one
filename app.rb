require_relative 'router'
require_relative 'app/repositories/customer_repository'
require_relative 'app/repositories/meal_repository'

require_relative 'app/controllers/customers_controller'
require_relative 'app/controllers/meals_controller'

customers_csv = File.join(__dir__, 'data', 'customers.csv')
meals_csv = File.join(__dir__, 'data', 'meals.csv')

customer_repository = CustomerRepository.new(customers_csv)
meal_repository = MealRepository.new(meals_csv)

customers_controller = CustomersController.new(customer_repository)
meals_controller = MealsController.new(meal_repository)

router = Router.new(meals_controller, customers_controller)
router.run
