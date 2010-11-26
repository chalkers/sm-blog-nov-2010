module ApplicationHelper

  def display_flashes(flash)
    flash.values.each do |message|
      content_tag(:p, message)
    end
  end

end
