require 'csv'
require_relative 'recipe'

class Cookbook # Repository, Fake Database
  attr_reader :recipes

  def initialize(csv_file)
    @recipes = []
    @csv_file = csv_file
    load_csv
  end

  def add_recipe(recipe)
    @recipes << recipe
    save_to_csv
  end

  def remove_recipe(recipe_id)
    @recipes.delete_at(recipe_id)
    save_to_csv
  end

  def mark_done(id)
    @recipes[id].status = !@recipes[id].status
    save_to_csv
  end

  def get_recipe(id)
    return @recipes[id]
  end

  private

  def save_to_csv
    CSV.open(@csv_file, 'w') do |csv|
      @recipes.each do |recipe|
        csv.puts([recipe.name, recipe.description, recipe.cooking_time, recipe.difficulty, recipe.status])
      end
    end
  end

  def load_csv
    return unless File.exist?(@csv_file)

    CSV.foreach(@csv_file) do |row|
      attributes = {
        name: row[0],
        description: row[1],
        cooking_time: row[2],
        difficulty: row[3],
        status: row[4] == 'true'
      }
      @recipes << Recipe.new(attributes)
    end
  end
end
