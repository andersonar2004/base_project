module ApplicationHelper

  def menu_item(label, path = nil, css = "", &block)
    if path
      content_tag(:li, :class => controller_name.eql?(path) ? " current" : "") do      
        concat(link_to(path){content_tag(:span, label)})
      end
    else
      content_tag(:li, :class => controller_name.eql?(path) ? "dropdown current" : "dropdown") do
        concat(link_to(path, :class => "dropdown-toggle", :"data-toggle" => "dropdown") { content_tag(:span, label)+content_tag(:b, "", :class => "caret") })
        if block_given?
          concat(content_tag(:ul, :class => "dropdown-menu") do
            yield
          end)
        end
      end
    end
  end

  def submenu_item(label, path, options = {})
    content_tag(:li) do
      link_to(label, path, options)
    end
  end

end
