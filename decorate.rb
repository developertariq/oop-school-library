require_relative 'nameable'

class Decorator < Nameable
  def initialize(nameable)
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end

class CapitalizeDecorator < Decorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end

class TrimmerDecorator < Decorator
  MAX_NAME_LENGTH = 10

  def correct_name
    name = @nameable.correct_name
    if name.length > MAX_NAME_LENGTH
      name.slice(0, MAX_NAME_LENGTH)
    else
      name
    end
  end
end