module BootstrapHelper
  def alert_success(dismissable = false)
    bootstrap_div_alerta('success', dismissable) { yield }
  end

  def alert_warning(dismissable = false)
    bootstrap_div_alerta('warning', dismissable) { yield }
  end

  def alert_danger(dismissable = false)
    bootstrap_div_alerta('danger', dismissable) { yield }
  end

  def bootstrap_div_alerta(css_class, dismissable = false)
    content_tag('div', class: "alert alert-#{css_class}", role: 'alert') do
      concat(capture { yield })
    end
  end
end
