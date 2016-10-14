$(document).ready(function(){
  $('.js_filter_cleaner').click(function(){
    clean_filters()
  });
});

function clean_filters(){
  $('input:text').attr('value', '');
  $('option:selected').attr('selected', false);
  $('li.selected').removeClass('selected');
  $('input:checkbox').not('#tw-switch').removeAttr("checked");
  $('.dropdown-menu.inner').each(function(){
    $(this).children().first().addClass("selected");
  });

  $('.selectpicker').each(function(){
    var id = $(this).attr('id');
    var reset_value = $(this).next().find('li.selected').find('span.text').text();
    $('*[data-id="'+id+'"] > span.filter-option').text(reset_value);
  });
}
