module MaterialFormComponentsHelper
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

  def material_checkbox_component(t_label, f, f_symbol, f_checkbox, &block)
    content_tag :div, class: 'checkbox m-b-15' do
      f.input f_symbol, label: false do
        concat(checkbox_element(t_label, f_checkbox, &block))
      end
    end
  end

  def checkbox_element(t_label, f_checkbox, &block)
    content_tag :label, t_label do
      concat(f_checkbox)
      concat(content_tag(:i, '', class: 'input-helper'))
      concat(t_label)
      concat capture(&block) if block_given?
    end
  end
end
