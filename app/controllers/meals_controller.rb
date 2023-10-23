require_relative '../views/meals_view.rb'

class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @meals_view = MealsView.new
  end

  def add
    name = @meals_view.ask_name
    price = @meals_view.ask_price
    meal = Meal.new(name: name, price: price)
    @meal_repository.create(meal)
  end

  def list
    meals = @meal_repository.all
    @meals_view.display_all(meals)
  end
end