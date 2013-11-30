# -*- encoding : utf-8 -*-
require 'net/http'

class StoryNewType < Story
  include ApplicationType

  before_create :set_domain

  permit :url, :description, :title, :tag_list

  validates_each :url do |record, attr, value|
    begin
      uri = URI.parse(value)
    rescue
      record.errors.add(attr, :url_invalid) and false
    end
  end

  def set_domain
    self.domain = URI.parse(url).host.downcase
  end
end
