module MaterialCarrierwaveComponentsHelper
  def material_download_button(attachment)
    destination = download_path(downloadable_params(attachment))
    text = File.basename(attachment.file.file, '.*')
    material_text_button(destination, text, '', 'attachment-alt')
  end

  def downloadable_params(attachment)
    model = attachment.model
    {
      class_name: model.class.name,
      attachment_name: attachment.mounted_as.to_s,
      attached_id: model.id
    }
  end
end
