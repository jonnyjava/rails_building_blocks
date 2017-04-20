module ApplicationHelper
  def active_menu_class(controllers, active_class = 'active')
    controllers.each do |cont, actions|
      return active_class if controller_name == cont && (action_name.in?(actions) || actions.empty?)
    end
    ''
  end

  def form_error(f, field)
    f.object.errors.key?(field)
    content_tag :div, class: 'has-error' do
      concat f.error field
    end
  end
end
