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
      concat(content_tag(:span, '', class: "zmdi zmdi-#{icon}") + ' ')
      concat(text) if text.present?
    end
  end

  def material_delete_button(destination)
    a_data = { confirm: 'Are you sure?',
               method: :delete,
               toggle: 'tooltip',
               placement: 'top',
               'original-title' => t('icons.delete') }
    content_tag :a, '', href: destination, data: a_data do
      concat(material_button(nil, 'btn-danger', 'delete', 'button'))
    end
  end

  def material_link_to(destination, options = {})
    material_link_to_default_options.reverse_merge(options)
    options[:data] = { toggle: 'tooltip', placement: 'top', 'original-title' => t("icons.#{options[:icon]}") } if options[:icon].present?
    a_class = "btn btn-default waves-effect #{options[:bg_color]}"
    content_tag :a, '', class: a_class, href: destination, target: options[:target], data: options[:data] do
      concat(content_tag(:span, '', class: "zmdi zmdi-#{options[:icon]}") + ' ') if options[:icon].present?
      concat(options[:anchor]) if options[:anchor].present?
    end
  end

  def material_link_to_default_options
    {
      anchor: '',
      bg_color: '',
      data: '',
      icon: '',
      icon_class: '',
      target: '_self'
    }
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
      concat(content_tag(:i, '', class: "c-white zmdi zmdi-#{icon}"))
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
