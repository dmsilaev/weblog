# -*- encoding : utf-8 -*-
require 'net/http'

class StoryNewType < Story
  include ApplicationType

  permit :url, :description, :title, :tag_list

  validates_each :url do |record, attr, value|
    begin
      uri = URI.parse(value)
    rescue
      record.errors.add(attr, :url_invalid) and false
    end
  end


end
