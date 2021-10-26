require 'csv'
require_relative '../models/meal'

class MealRepository
  def initialize(csv_path)
    @csv_path = csv_path
    @meals = []
    @next_id = 1
    load_csv if File.exist?(@csv_path)
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

  def find(id)
    @meals.find { |meal| meal.id == id }
  end

  def save_csv
    CSV.open(@csv_path, 'wb') do |csv|
      csv << %w[id name price]
      @meals.each do |meal|
        csv << [meal.id, meal.name, meal.price]
      end
    end
  end

  def load_csv
    CSV.foreach(@csv_path, headers: :first_row, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i
      row[:price] = row[:price].to_i
      @meals << Meal.new(row)
    end
    @next_id = @meals.last.id + 1 unless @meals.empty?
  end
end
