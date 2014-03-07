module ApplicationHelper
	def errors_for(object, message=nil)
    html = ""
    unless object.errors.blank?
      html << "<div class='formErrors #{object.class.name.humanize.downcase}Errors'>\n"
      if message.blank?
        if object.new_record?
          html << "\t\t<h5>There was a problem creating the #{object.class.name.humanize.downcase}</h5>\n"
        else
          html << "\t\t<h5>There was a problem updating the #{object.class.name.humanize.downcase}</h5>\n"
        end    
      else
        html << "#{message}"
      end  
      html << "\t\t<ul>\n"
      object.errors.full_messages.each do |error|
        html << "\t\t\t<li>#{error}</li>\n"
      end
      html << "\t\t</ul>\n"
      html << "\t</div>\n"
    end
    html
  end 

  def wicked_pdf_image_tag_for_public(img, options={})
      if img[0] == "/"
        new_image = img.slice(1..-1)
        image_tag "file://#{Rails.root.join('public', new_image)}", options
      else
        image_tag "file://#{Rails.root.join('public', 'images', img)}", options
      end
  end  

                             
end
