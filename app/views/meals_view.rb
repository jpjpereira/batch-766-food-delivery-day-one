class MealsView
  def ask_for(attribute)
    puts "What's the #{attribute} of the meal?"
    gets.chomp
  end

  def display(meals)
    meals.each do |meal|
      puts "#{meal.id} - #{meal.name} - $#{meal.price}"
    end
  end
end
