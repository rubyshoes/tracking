module EmployeesHelper

  # Returns the Gravatar (http://gravatar.com/) for the given employee.
  def gravatar_for(employee, options = { :size => 50 })
    gravatar_image_tag(employee.email.strip,  :alt => h(employee.full_name),
                                      :class => 'gravatar round',
                                      :gravatar => options)
  end
end
