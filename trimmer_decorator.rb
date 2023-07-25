require_relative 'base_decorator'

class TrimmerDecorator < BaseDecorator
  def correct_name
    super[0..9]
  end
end
