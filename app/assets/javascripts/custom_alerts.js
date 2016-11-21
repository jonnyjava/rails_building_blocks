$.rails.allowAction = function(link) {
  if (!link.attr('data-confirm')) {
    return true;
  }
  $.rails.showConfirmDialog(link);
  return false;
};

$.rails.confirmed = function(link) {
  link.removeAttr('data-confirm');
  return link.trigger('click.rails');
};

$.rails.showConfirmDialog = function(link) {
  var corporateHue = '#c11933';
  swal({
    title: "Estás seguro?",
    text: "Una vez borrada, esta información no podrá ser recuperada",
    type: "warning",
    showCancelButton: true,
    confirmButtonColor: corporateHue,
    confirmButtonText: "Si, estoy seguro",
    cancelButtonText: "No, cancelar",
    cancelButtonColor: '#d33'
  }).then(function(){
    swal("Borrado", "Operación realizada con exito.", "success");
    return $.rails.confirmed(link);
  }, function (dismiss) {
    if (dismiss === 'cancel') {
      swal({
        title: "Operación anulada",
        text: "Nada ha sido borrado",
        type: "error",
        confirmButtonColor: corporateHue,
        confirmButtonText: "Perfecto, gracias!"
      });
    }
  })
};
