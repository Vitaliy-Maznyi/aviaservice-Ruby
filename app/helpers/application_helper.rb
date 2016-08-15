module ApplicationHelper

  BOOTSTRAP_FLASH_MSG = {
      success: 'alert-success',
      danger: 'alert-danger',
      alert: 'alert-block',
      notice: 'alert-info'
  }

  def bootstrap_class_for(flash_type)
    BOOTSTRAP_FLASH_MSG.fetch(flash_type.to_sym, flash_type.to_s)
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} fade in") do
        concat content_tag(:button, '×'.html_safe, class: "close", data: { dismiss: 'alert' })
        concat message
      end)
    end
    nil
  end


  def duration(date1,date2)
    secs = (date2 - date1).round
    mins  = secs / 60
    hours = mins / 60

    if hours > 0
      "#{hours} h #{mins % 60} m"
    else
      "#{mins % 60} m"
    end
  end
end
