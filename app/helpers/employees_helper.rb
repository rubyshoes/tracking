module EmployeesHelper
  
  def gravatar_for(employee, options = { :size => 50 })
    gravatar_image_tag(employee.email.downcase, :alt => h(employee.first_name),
                                                :class => 'gravatar',
                                                :gravatar => options)
  end
end
