require_relative 'recipe'
require_relative 'cookbook'
require_relative 'view'
require_relative 'parsing'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
    @parser = Parser.new
  end

  def list
    recipes = @cookbook.recipes
    @view.display_recipes(recipes)
  end

  def show_recipe
    list
    id = @view.ask_for_index
    recipe = @cookbook.get_recipe(id)
    @view.display_recipe(recipe)
  end

  def create
    list
    recipe = Recipe.new(attributes)
    @cookbook.add_recipe(recipe)
  end

  def destroy
    list
    id = @view.ask_for_index
    @cookbook.remove_recipe(id)
  end

  def mark
    recipes = @cookbook.recipes
    @view.list_recipes_with_index(recipes)
    id = @view.ask_for_index
    @cookbook.mark_done(id)
  end

  def search
    id = @view.ask_user_for_website
    return search_in_marmiton if id == 1
    return search_in_letscook if id == 2
  end

  def search_in_marmiton
    keyword = @view.ask_for_keyword_fr
    difficulty = @view.ask_for_difficulty
    list_recipe = @parser.analyse_html_marmiton(keyword,difficulty)
    return @view.nothing if list_recipe.empty?
    attributes = @view.get_user_choice(list_recipe)
    recipe = Recipe.new(attributes)
    @cookbook.add_recipe(recipe)
  end

  def search_in_letscook
    keyword = @view.ask_for_keyword_eng
    difficulty = @view.ask_for_difficulty
    list_recipe = @parser.analyse_html_letscook(keyword,difficulty)
    return @view.nothing if list_recipe.empty?
    attributes = @view.get_user_choice(list_recipe)
    recipe = Recipe.new(attributes)
    @cookbook.add_recipe(recipe)
  end
end
