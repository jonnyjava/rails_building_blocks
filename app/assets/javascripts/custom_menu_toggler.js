jQuery(document).ready(function(){
  var layoutStatus = localStorage.getItem('ma-layout-status');
  if (layoutStatus == 1) {
    console.log('oh ma diobono');
    $('body').removeClass('toggled sw-toggled');
    $('#tw-switch').prop('checked', false);
  }

  $('body').on('change', '#toggle-width input:checkbox', function () {
    if ($(this).is(':checked')) {
      setTimeout(function () {
        $('body').addClass('toggled sw-toggled');
        localStorage.setItem('ma-layout-status', 0);
      }, 250);
    }
    else {
      setTimeout(function () {
        $('body').removeClass('toggled sw-toggled');
        localStorage.setItem('ma-layout-status', 1);
      }, 250);
    }
  });
});
