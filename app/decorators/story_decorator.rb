# -*- encoding : utf-8 -*-
class StoryDecorator < Draper::Decorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  def host_name
    model.host.name
  end

end
