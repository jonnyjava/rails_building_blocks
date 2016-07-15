module ApplicationHelper
  def body_classes(params)
    list = [controller_name, action_name]
    list << params[:id] if controller_name == 'statics'
    list.join(' ')
  end

  def number_field_config(placeholder, mask)
    {
      as: :string,
      label: false,
      class: 'form-control input-mask',
      input_html: { data: { mask: mask } },
      placeholder: t(placeholder)
    }
  end

  def datepicker_config(value)
    value = value.strftime('%d/%m/%Y') if value
    {
      as: :string,
      class: 'form-control date-picker',
      placeholder: t('choose_date'),
      value: value,
      label: false
    }
  end

  def textarea_config
    {
      as: :text,
      label: false,
      input_html: { class: 'form-control auto-size' }
    }
  end

  def selectpicker_config(collection)
    {
      as: :select,
      collection: collection,
      include_blank: false,
      label: false,
      class: 'selectpicker'
    }
  end

  def radiobuttons_config(collection)
    {
      collection: collection,
      label_method: :first,
      value_method: :last,
      as: :material_radio_buttons,
      label: false
    }
  end

  def material_list_element_component(label, content)
    content_tag :dl, class: 'dl-horizontal' do
      concat(content_tag(:dt, label))
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
end
