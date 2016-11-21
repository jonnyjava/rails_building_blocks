$(document).ready(function () {
    $('body').on('click', '[data-ma-action]', function (e) {

        var $this = $(this);
        var action = $(this).data('ma-action');

        switch (action) {
          case 'profile-menu-toggle':
            e.preventDefault();
            $this.parent().toggleClass('toggled');
            $this.next().slideToggle(200);

            break;
        }
    });
});
