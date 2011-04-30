module ApplicationHelper
  def title
    base_title = "GreenDrive"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
 
  def logo
    image_tag("logo.png", :alt => "Green Drive", :class => "round")
  end

end
