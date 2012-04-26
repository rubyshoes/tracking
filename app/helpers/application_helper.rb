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

  def link_to_add_fields(name, codeline, association)
    /debugger/
    new_object = codeline.object.send(association).klass.new_object
    id = new_object.object_id
    fields = codeline.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", codeline: builder)
    end
    link_to(name, '#', class: "add_codes", data: {id: id, fields: fields.gsub("\n", "")})
  end
end
