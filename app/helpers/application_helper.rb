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

  # See Railscast episode for information about this helper. Note that for readability, I rendered
  # the hard coded partial. RailsCasts generalizes it, and we can do the same.

  def link_to_add_fields(name, form, association)
    new_codeline = form.object.send(association).klass.new
    id = new_codeline.object_id
    fields = form.fields_for(association, new_codeline, child_index: id) do |codeline|
      render("codeline_fields", codeline: codeline)
    end
    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end

end
