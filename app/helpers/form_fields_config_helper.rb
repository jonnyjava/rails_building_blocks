module FormFieldsConfigHelper
  def number_field_config(placeholder, mask)
    {
      as: :string,
      label: false,
      class: 'form-control input-mask',
      input_html: { data: { mask: mask }, class: 'js_demask' },
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

  def selectpicker_config(collection, css_class = nil)
    {
      as: :select,
      collection: collection,
      include_blank: false,
      label: false,
      class: "selectpicker #{css_class}"
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
end
