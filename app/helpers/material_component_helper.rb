module MaterialComponentHelper
  def material_icon_tooltip(icon, tooltip_text)
    data_attributes = { placement: 'top', toggle: 'tooltip' }
    content_tag :span, class: 'f-20 f-700 help-system', data: data_attributes, title: tooltip_text do
      content_tag :i, '', class: "zmdi zmdi-#{icon}"
    end
  end

  def material_list_element_component(label, content)
    content_tag :dl, class: 'dl-horizontal' do
      concat(content_tag(:dt, label, class: 'm-r-30'))
      concat(content_tag(:dd, content))
    end
  end

  def material_form_component(t_label, icon, f_field)
    content_tag :div, class: 'input-group' do
      concat(material_icon_component(icon))
      concat(material_input_component(t_label, f_field))
    end
  end

  def material_icon_component(icon)
    content_tag :span, class: 'input-group-addon' do
      content_tag :i, '', class: "zmdi zmdi-#{icon}"
    end
  end

  def material_input_component(t_label, f_field)
    content_tag :div, class: 'fg-line' do
      concat(content_tag(:label, t_label))
      concat(f_field)
    end
  end

  def material_button(text, bg_color, icon, type)
    content_tag :button, class: "btn btn-default waves-effect #{bg_color}", type: type do
      concat(content_tag(:span, '', class: "zmdi zmdi-#{icon}"))
      concat(text) if text.present?
    end
  end

  def material_delete_button(destination)
    content_tag :a, '', href: destination, method: :delete, data: { confirm: 'Are you sure?' } do
      concat(material_button(nil, 'bgm-red', 'delete', 'button'))
    end
  end

  def material_text_button(destination, text, bg_color, icon)
    content_tag :a, '', href: destination do
      concat(material_button(text, "btn-icon-text #{bg_color}", icon, 'button'))
    end
  end

  def material_icon_button(destination, bg_color, icon)
    content_tag :a, '', href: destination do
      concat(material_button(nil, bg_color, icon, 'button'))
    end
  end

  def material_mini_pie_graph(percent, value, title)
    content_tag :div, class: 'easy-pie js_mini_counter_red p-r-25', data: { percent: percent } do
      concat(content_tag(:div, value, class: 'percent m-l-5'))
      concat(content_tag(:div, title, class: 'pie-title'))
      concat(tag('canvas', height: '95', width: '25'))
    end
  end
end
