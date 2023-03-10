require_relative 'decorate'

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
