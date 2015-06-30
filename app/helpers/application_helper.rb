module ApplicationHelper
  def urls_to_images(s)
    s.gsub! /\s(http:\/\/.*?\.(png|jpg))\s/, 
      ' <img class="content_image" src="\1" /> '
    s.html_safe
  end

  def urls_to_links(s)
    s.gsub! /\s(http:\/\/.*?)\s/, 
      ' <a class="content_link" href="\1" target="_blank">\1</a> '
    s.html_safe    
  end

 
end
