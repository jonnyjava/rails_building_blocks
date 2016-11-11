= search_form_for @q do |f|
  .row.m-20
    .col-xs-4
  .row.m-20
    br

  .row.m-20
    .col-xs-8
    .col-xs-2= material_button(t('search'), 'btn-icon-text', 'search', 'submit')
    .col-xs-2= material_button(t('clean_search'), 'btn-icon-text bgm-corporate js_filter_cleaner', 'delete', 'reset')
