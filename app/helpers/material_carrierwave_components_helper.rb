module MaterialCarrierwaveComponentsHelper
  def material_download_button(attachment, opts = {})
    defs = {
      anchor: t('download_file')
    }
    opts.reverse_merge!(defs)
    destination = download_path(downloadable_params(attachment))
    text = File.basename(attachment.file.file, '.*')
    material_link_to(destination, icon: 'attachment-alt', anchor: opts[:anchor])
  end

  def downloadable_params(attachment)
    {
      class_name: attachment.model.class.name,
      attachment_name: attachment.mounted_as.to_s,
      attached_id: attachment.model.id
    }
  end
end
