class Recipe
  attr_reader :name, :description, :cooking_time, :difficulty
  attr_accessor :status

  def initialize(attributes)
    @name = attributes[:name]
    @description = attributes[:description]
    @cooking_time = attributes[:cooking_time]
    @status = attributes[:status]
    @difficulty = attributes[:difficulty]
  end
end
