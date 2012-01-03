module EmployeesHelper

  def gravatar_for(employee, options = { :size => 50 })
    gravatar_image_tag(employee.email.downcase, :alt => h(employee.emp_full_name),
                                                :class => 'gravatar round',
                                                :gravatar => options)
  end
end
