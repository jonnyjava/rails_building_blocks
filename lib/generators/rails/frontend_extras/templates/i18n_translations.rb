es:
  <%= singular_table_name %>:
    one: ''<% if self.shell.base.respond_to?(:attributes)%>
    other: 's'<%  self.shell.base.attributes.each do |attribute|%>
    <%= attribute.name%>: '<%= attribute.name%>'<%end%><% end %>
    ransack:
