class View
  def display_recipes(recipes)
    recipes.each_with_index do |recipe, index|
      puts "#{index} - #{recipe.status ? "[x]" : "[ ]"} - #{recipe.name} - #{recipe.difficulty} - #{recipe.cooking_time}"
    end
  end

  def display_recipe(recipe)
    print `clear`
    puts "#{recipe.status ? "You already do this one" : "You never cook it"}"
    puts "name: #{recipe.name}"
    puts "Cooking time: #{recipe.cooking_time}"
    puts "Difficulty: #{recipe.difficulty}"
    puts "Descritpion: #{recipe.description}"
  end

  def ask_for_name_and_details
    attributes = {}
    puts "What's the recipe name?"
    print "Name -> "
    attributes[:name] = gets.chomp
    puts "What's the recipe difficulty?"
    print "Difficulty -> "
    attributes[:difficulty] = gets.chomp
    puts "What's the recipe cooking time?"
    print "Cooking Time -> "
    attributes[:cooking_time] = gets.chomp
    puts "Please describe your recipe"
    print "Descritpion -> "
    attributes[:description] = gets.chomp
    attributes[:status] = false
    return attributes
  end

  def ask_for_index
    puts "What's the recipe index you want to remove?"
    print "Index -> "
    index = gets.chomp.to_i
    return index
  end

  def ask_for_keyword_eng
    puts "Give an ingredient to search for recipe in letscookfrench.com (English)"
    print "Ingredient (English) -> "
    keyword = gets.chomp
    return keyword.downcase
  end

  def ask_for_keyword_fr
    puts "Give an ingredient to search for recipe in letscookfrench.com (French)"
    print "Ingredient (French) -> "
    keyword = gets.chomp.downcase
    return keyword
  end

    def ask_user_for_website
    puts "Select a website -> [1] Marmiton or [2] LetsCookFrench"
    print "id -> "
    id = gets.chomp.to_i
    case id
    when 1 then id = 1
    when 2 then id = 2
    else
      puts "Please press 1 or 2"
    end
    return id
  end

  def ask_for_difficulty
    puts "Select a difficulty -> Very easy | Easy | Moderate | Difficult | All"
    print "Difficulty -> "
    difficulty = gets.chomp.downcase
    case difficulty
    when "very easy" then difficulty = '&dif=1'
    when "easy" then difficulty = '&dif=2'
    when "moderate" then difficulty = '&dif=3'
    when "difficult" then difficulty = '&dif=4'
    when "all" then difficulty = ''
    else
      puts "Please press Very easy, Easy, Moderate, Difficult"
    end
    return difficulty
  end

  def get_user_choice(list_recipe)
    puts "Here is what we find:"
    list_recipe.each_with_index do |recipe, index|
      puts "#{index} - #{recipe[:name]} - (#{recipe[:cooking_time]})"
    end
    puts "What's the recipe index you want to add ?"
    print "Index -> "
    index = gets.chomp.to_i
    return list_recipe[index]
  end

  def nothing
    return puts "We found nothing, try another keyword or another difficulty !"
  end
end
