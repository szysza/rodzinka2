module ApplicationHelper
  def link_to_family(family)
    raw "<p>#{link_to family.name, family}</p>"
  end
end
