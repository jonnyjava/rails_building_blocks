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
  swal({
      title: "Estás seguro?",
      text: "Una vez borrada, esta información no podrá ser recuperada",
      type: "warning",
      showCancelButton: true,
      confirmButtonColor: "#F44336",
      confirmButtonText: "Si, estoy seguro",
      cancelButtonText: "No, cancelar",
      closeOnConfirm: false,
      closeOnCancel: false
  }, function(isConfirm){
      if (isConfirm) {
          swal("Borrado", "Operación realizada con exito.", "success");
          return $.rails.confirmed(link);
      } else {
          swal("Operación anulada", "Nada ha sido borrado", "error");
      }
  });
};
