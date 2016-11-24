es:
  <%= singular_table_name %>:
    one: ''
    other: 's'<%  self.shell.base.attributes.each do |attribute|%>
    <%= attribute.name%>: '<%= attribute.name%>'<%end%>
    ransack:
