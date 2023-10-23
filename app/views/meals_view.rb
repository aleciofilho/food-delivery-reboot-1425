class MealsView
  def ask_name
    puts "Name of the meal"
    gets.chomp
  end
  
  def ask_price
    puts "Price?"
    gets.chomp.to_i
  end

  def display_all(meals)
    meals.each_with_index do |meal, i|
      puts "#{i + 1} - #{meal.name}: $#{meal.price}"
    end
  end
end