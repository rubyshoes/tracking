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

  def link_to_add_fields(add_fields, codeline, code)
    /debugger/
    new_object = codeline.object.send(code).klass.new
    id = new_object.object_id
    fields = codeline.fields_for(code, new_object, child_index: id) do |builder|
      render(code.to_s.singularize + "_fields", f: builder)
    end 
    link_to(name, '#', class: "add_codes", data: {id: id, fields: fields.gsub("\n", "")})
  end
end
