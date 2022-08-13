module BootstrapFlashHelper
  def bootstrap_flash
    capture do
      flash.each do |type, messages|
        bootstrap_alerts_for_type(bootstrap_flash_type(type), messages)
      end
    end
  end

  def bootstrap_alerts_for_type(type, messages)
    return if type.blank?

    Array(messages).each do |msg|
      concat(send("alert_#{type}", true) { simple_format(msg, {}, wrapper_tag: 'span') })
    end
  end

  def bootstrap_flash_type(type)
    { notice: :success, alert: :warning, error: :danger }[type.to_sym]
  end
end
