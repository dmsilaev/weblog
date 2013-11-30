# -*- encoding : utf-8 -*-
module Web::Admin::StoriesHelper
  def publish_links(query)
    case query[:publish]
    when "new"
      links = [(link_to t(".new"), "#", class: "publish_link new first"),
              (link_to t(".publish"), admin_stories_path, class: "publish_link publish hide"),
              (link_to t(".published"), admin_stories_path(q: { state_cont: :published }), class: "publish_link published hide") ]
    when "pubished"
      links = [(link_to t(".published"), '#', class: "publish_link published first"),
              (link_to t(".new"), admin_stories_path(q: { state_cont: :new }), class: "publish_link_new"),
              (link_to t(".publish"), admin_stories_path, class: "publish_link publish hide")]
    else
      links = [(link_to t(".publish"), '#', class: "publish_link publish first"),
              (link_to t(".published"), admin_stories_path(q: { state_cont: :published }), class: "publish_link published hide"),
              (link_to t(".new"), admin_stories_path(q: { state_cont: "new" }), class: "publish_link_new")]
    end

  end
end
