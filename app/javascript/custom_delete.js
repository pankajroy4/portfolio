let customConfirmationWithJqueryConfirm = function () {
  $.rails.allowAction = function (link) {
    console.log("link is present in allowaction :", link);
    if (!link.attr("data-confirm")) {
      console.log("returning true");
      return true;
    }
    $.rails.showConfirmDialog(link);
    console.log("returning false");
    return false;
  };
  console.log("Button clicked");

  $.rails.confirmed = function (link) {
    console.log("link is present in confirm:", link);
    link.removeAttr("data-confirm");
    return link.trigger("click.rails");
  };

  $.rails.showConfirmDialog = function (link) {
    console.log("link is present in showConfirmDialog:", link);
    var message;

    message = link.attr("data-confirm");
    console.log("message:", message);
    console.log("typeof $.confirm is :", typeof $.confirm);
    $.confirm({
      title: "Confirm Account Deletion",
      backgroundDismiss: true,
      type: "red",
      icon: "fa-solid fa-triangle-exclamation",
      typeAnimated: true,
      boxWidth: "25%",
      useBootstrap: false,
      draggable: true,
      // theme: 'supervan',
      content: message,
      buttons: {
        confirm: {
          btnClass: "btn-red btn-spacing",
          text: "Yes",
          action: function () {
            link.removeAttr("data-confirm");
            $.rails.confirmed(link);
          },
        },
        cancel: {
          text: "No",
          btnClass: "btn-green btn-spacing",
          action: function () {},
        },
      },
    });
  };
};

document.addEventListener("turbo:load", function () {
  $(".delete-account-btn").on("click", function (event) {
    customConfirmationWithJqueryConfirm();
  });
});
