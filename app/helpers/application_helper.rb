module ApplicationHelper

  def logo
   logo = image_tag("rails.png", :alt => "Time and it's Cost", class:  "round")
  end

  # Return title on a per-page basis.
  def title
    base_title = "Time and it's Cost"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
end
