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
end
