# -*- encoding : utf-8 -*-
class AddDomainToStories < ActiveRecord::Migration
  def change
    add_column :stories, :domain, :string
  end
end
