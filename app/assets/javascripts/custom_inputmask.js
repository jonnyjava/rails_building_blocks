jQuery(document).ready(function(){
  jQuery('button:submit').click(function(){
    jQuery('.js_demask').each(function(){
      var number = $(this).val();
      if (number){
        var unmasked_number = number.replace(/,|\./g, '');
        $(this).val(unmasked_number);
      }
    });
  });
});
