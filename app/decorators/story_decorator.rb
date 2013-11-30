class StoryDecorator < Draper::Decorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  def created_at_ago(time)
    label_tag(nil, time,
              :title => object.created_at.strftime("%F %T %z"))
  end

end
