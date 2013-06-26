module ApplicationHelper
  def flash_class(type)
    case type
    when :alert
      "alert-error"
    when :notice
      "alert-success"
    else
      ""
    end
  end
  
  
  def display_address(address)
    content_tag(:div,
    (content_tag(:p, content_tag(:b, address.name)) + 
    content_tag(:p, address.address1) +
    content_tag(:p, address.address2) +
    content_tag(:p, address.city + ", " + address.state + " " + address.zip)), :class =>"display-address")
  end
  

end

