module FormFieldsConfigHelper

  def text_field_config(placeholder, options = {})
    {
      label: false,
      placeholder: placeholder,
      as: :string,
    }.merge(options)
  end

  def number_field_config(placeholder, mask, value)
    {
      as: :string,
      label: false,
      class: 'form-control input-mask',
      input_html: { data: { mask: mask, 'mask-reverse': 'true' }, class: 'js_demask', value: value },
      placeholder: placeholder
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

  def selectpicker_config(collection, css_class = nil)
    {
      as: :select,
      collection: collection,
      include_blank: false,
      label: false,
      class: "selectpicker #{css_class}"
    }
  end

  def radiobuttons_config(collection, value)
    {
      collection: collection,
      label_method: :first,
      value_method: :last,
      as: :material_radio_buttons,
      checked: value,
      label: false
    }
  end

  def typeahead_field_config(placeholder, value)
    {
      as: :string,
      class: 'string optional form-control typeahead',
      placeholder: placeholder,
      value: value
    }
  end
end
