module ApplicationHelper

  def logo
   logo = image_tag("rails.png", alt: "Time and it's Cost", class:  "round")
  end

  # Return title on a per-page basis.
  def full_title(page_title)
    base_title = "Time and it's Cost"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
end
