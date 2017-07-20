class Router
  def initialize(controller)
    @controller = controller
    @running    = true
  end

  def run
    puts "Welcome to the Cookbook!"
    puts "           --           "

    while @running
      display_tasks
      action = gets.chomp.to_i
      print `clear`
      route_action(action)
    end
  end

  private

  def route_action(action)
    case action
    when 1 then @controller.list
    when 2 then @controller.show_recipe
    when 3 then @controller.create
    when 4 then @controller.destroy
    when 5 then @controller.search
    when 6 then @controller.mark
    when 7 then stop
    else
      puts "Please press 1, 2, 3, 4, 5, 6, 7"
    end
  end

  def stop
    @running = false
  end

  def display_tasks
    puts ""
    puts "What do you want to do next?"
    puts "1 - List all recipes"
    puts "2 - Show a recipe"
    puts "3 - Create a new recipe"
    puts "4 - Destroy a recipe"
    puts "5 - Import recipes from LetsCookFrench(eng) or from Marmiton(fr)"
    puts "6 - Mark a recipe as done"
    puts "7 - Stop and exit the program"
  end
end

