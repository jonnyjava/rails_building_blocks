module MaterialComponentsHelper
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

  def material_button(text, bg_color, icon, type, data = {})
    content_tag :button, class: "btn btn-default waves-effect #{bg_color}", type: type, data: data do
      concat(content_tag(:span, '', class: "zmdi zmdi-#{icon}"))
      concat(text) if text.present?
    end
  end

  def material_delete_button(destination)
    content_tag :a, '', href: destination, data: { confirm: 'Are you sure?', method: :delete } do
      concat(material_button(nil, 'bgm-red', 'delete', 'button'))
    end
  end

  def material_text_button(destination, text, bg_color, icon)
    content_tag :a, '', href: destination do
      concat(material_button(text, "btn-icon-text #{bg_color}", icon, 'button'))
    end
  end

  def material_icon_button(destination, bg_color, icon, target = '_self')
    content_tag :a, '', href: destination, target: target do
      concat(material_button(nil, bg_color, icon, 'button'))
    end
  end

  def material_mini_counter_graph(percent, value, title)
    content_tag :div, class: 'easy-pie js_mini_counter_red p-r-25', data: { percent: percent } do
      concat(content_tag(:div, value, class: 'percent m-l-5'))
      concat(content_tag(:div, title, class: 'pie-title'))
      concat(tag('canvas', height: '95', width: '25'))
    end
  end

  def material_mini_icon_panel(value, title, icon, css_class)
    content = material_icon_for_panel(icon)
    content += material_panel_legend(value, title)
    material_mini_panel(css_class, content)
  end

  def material_icon_for_panel(icon)
    content_tag :div, class: 'chart m-l-30 m-r-30' do
      concat(content_tag(:i, '', class: "f-40 c-white zmdi zmdi-#{icon}"))
    end
  end

  def material_panel_legend(value, title)
    content_tag :div, class: 'count' do
      concat(content_tag(:small, title))
      concat(content_tag(:h2, value))
    end
  end

  def material_mini_panel(css_class, content)
    content_tag :div, class: "mini-charts-item m-b-10 #{css_class}" do
      content_tag :div, class: 'clearfix' do
        concat(content)
      end
    end
  end

  def material_mini_counter_panel(value, title, css_class)
    content = material_mini_counter_panel_chart(value)
    content += material_mini_counter_panel_legend(value, title)
    material_mini_panel(css_class, content)
  end

  def material_mini_counter_panel_chart(value)
    content_tag :div, class: 'chart p-b-0' do
      content_tag :div, class: 'easy-pie counter-pie js_counter_chart', data: { percent: value.to_s } do
        concat(content_tag(:div, value, class: 'percent c-white'))
      end
    end
  end

  def material_mini_counter_panel_legend(value, title)
    content_tag :div, class: 'count c-white' do
      concat(content_tag(:h5, title, class: 'c-white'))
      concat(content_tag(:h2, "#{value}%"))
    end
  end

  def material_menu_link_helper(destination, icon, label)
    content_tag :li do
      content_tag :a, '', href: destination do
        concat(content_tag(:i, '', class: "zmdi zmdi-#{icon}"))
        concat(label)
      end
    end
  end
end
