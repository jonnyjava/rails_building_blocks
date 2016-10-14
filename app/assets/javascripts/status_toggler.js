jQuery(document).ready(function(){
  jQuery('.js_status_toggler').click(function(){
    jQuery(this).toggleClass('bgm-corporate bgm-lightblue');
    jQuery(this).children(":first").toggleClass('zmdi-check zmdi-close');
  });
});
