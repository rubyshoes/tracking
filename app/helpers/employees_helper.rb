module EmployeesHelper

  # Returns the Gravatar (http://gravatar.com/) for the given employee.
  def gravatar_for(employee, options = { :size => 50 })
    gravatar_id = Digest::MD5::hexdigest(employee.email.downcase)
    size = options[:size]
    gravatar_url = "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
    gravatar_image_tag(gravatar_url,  :alt => h(employee.emp_full_name),
                                      :class => 'gravatar round',
                                      :gravatar => options)
  end
end
