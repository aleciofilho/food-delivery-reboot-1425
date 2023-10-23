class MealRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @meals = []
    load_csv if File.exist?(@csv_file)
    @next_id = @meals.empty? ? 1 : @meals.last.id + 1
  end

  def create(meal)
    meal.id = @next_id
    @next_id += 1
    @meals << meal
    save_csv
  end

  def all
    @meals
  end

  def find(meal_id)
    @meals.find { |meal| meal.id == meal_id }
  end

  private

  def save_csv
    CSV.open(@csv_file, 'wb') do |csv|
      csv << %i[id name price]
      @meals.each do |meal|
        csv << [meal.id, meal.name, meal.price]
      end
    end
  end

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i # id =
      row[:price] = row[:price].to_i # price =
      @meals << Meal.new(row) # Meal.new(id: id, name: name, price: price)
    end
  end

end