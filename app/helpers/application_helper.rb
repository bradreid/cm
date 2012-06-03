module ApplicationHelper
  
  def status_image(status)
    image = "link_icons/cross.png"
    if status.is_a? TrueClass
      image = "link_icons/tick.png" if status
    else
      case status
      when String
        image = "link_icons/tick.png" if status.downcase == 'active'
      else
        image = "link_icons/tick.png" if status
      end
    end
    image_tag image
  end
  
  def image_url(source)
    abs_path = image_path(source)
    unless abs_path =~ /^http/
      abs_path = "#{request.protocol}#{request.host_with_port}#{abs_path}"
    end
    abs_path
  end
    
end
