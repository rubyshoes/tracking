module ApplicationHelper

  def logo
   logo = image_tag("rails.png", :alt => "Tracking Time", :class => "round")
  end

  # Return a title on a per-page basis.
  def title
    base_title = "Tracking Time"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
end
