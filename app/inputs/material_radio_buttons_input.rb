class MaterialRadioButtonsInput < SimpleForm::Inputs::CollectionRadioButtonsInput
  def input(_wrapper_options)
    label_method, value_method = detect_collection_methods
    iopts = { checked: input_options[:checked] || collection.first }
    @builder.send(
      'collection_radio_buttons',
      attribute_name,
      collection,
      value_method, label_method, iopts,
      input_html_options,
      &collection_block_for_nested_boolean_style
    )
  end

  protected

  def build_nested_boolean_style_item_tag(collection_builder)
    tag = '<div class="radio radio-inline"><label class="radio-label">'.html_safe
    tag << collection_builder.radio_button + I18n.translate(collection_builder.value)
    tag << '<i class="input-helper"></i></label></div>'.html_safe
    tag.html_safe
  end
end
