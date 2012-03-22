module ContractsHelper

#  def link_to_add_fields(name, f, association, locals={})
#    new_object = f.object.class.reflect_on_association(association).klass.new
#    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
#      render(association.to_s.singularize + "_fields", locals.merge!(:f => builder))
#    end
#
#    link_to(name, "#", :class => "dynamic_add", 'data-association' => "#{associationi}", 'data-content' => "#{fields}")
#  end
end

