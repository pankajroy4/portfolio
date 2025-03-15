// import { Controller } from "@hotwired/stimulus";

// import $ from "jquery";
// window.$ = window.jQuery = $;

// window.jQueryUjs = require("jquery-ujs/src/rails.js");
// window.$.rails = window.jQueryUjs;

// window.jQueryConfirm = require("jquery-confirm/dist/jquery-confirm.min.js");
// require("jquery-confirm/dist/jquery-confirm.min.css");
// window.$.confirm = window.jQueryConfirm;

// export default class extends Controller {
//   static values = { title: String, content: String, confirms: String, cancel: String }
//   connect() {
//     window.jQueryUjs = require("jquery-ujs/src/rails.js");
//     window.$.rails = window.jQueryUjs;

//     console.log("Confirm controller connected");
//     console.log("✅ jQuery Loaded:", $);
//     console.log("✅ jquery-confirm loaded:", $.confirm);
//     console.log("✅ jquery-ujs loaded:", $.rails);
//   }

//   process(event){
//     console.log("button clicked")
//     const titleText = this.titleValue
//     const contentText = this.contentValue
//     const confrimsText = this.confirmsValue
//     const cancelText = this.cancelValue

//     if (!$.rails) {
//       console.error("jquery-ujs is not loaded properly");
//       return;
//     }

//     $.rails.allowAction = function (link) {
//       console.log("Checking allowAction for:", link);

//       if (!link.attr("data-confirm")) {
//         console.log("returnning true")
//         return true;
//       }
//       $.rails.showConfirmDialog(link);
//       return false;
//     };

//     $.rails.confirmed = function (link) {
//       console.log("Confirmed action for:", link);
//       link.removeAttr("data-confirm");
//       return link.trigger("click.rails");
//     };

//     $.rails.showConfirmDialog = function (link) {
//       console.log("In show confirm dialouge");
//       $.confirm({
//         title: titleText,
//         content: contentText,
//         type: "red",
//         icon: "fa-solid fa-triangle-exclamation",
//         buttons: {
//           confirm: {
//             text: confrimsText,
//             btnClass: "btn-red",
//             action: function () {
//               link.trigger("click.rails");
//             },
//           },
//           cancel: {
//             text: cancelText,
//             btnClass: "btn-green",
//           },
//         },
//       });
//     };

//   }
// }

// import { Controller } from "@hotwired/stimulus";
// import $ from "jquery";

// window.$ = window.jQuery = $;

// window.jQueryUjs = require("jquery-ujs/src/rails.js");
// window.$.rails = window.jQueryUjs;

// window.jQueryConfirm = require("jquery-confirm/dist/jquery-confirm.min.js");
// require("jquery-confirm/dist/jquery-confirm.min.css");
// window.$.confirm = window.jQueryConfirm;

// export default class extends Controller {
//   static values = {
//     title: String,
//     content: String,
//     confirms: String,
//     cancel: String
//   };

//   connect() {
//     console.log("Confirm controller connected");
//     console.log("✅ jQuery Loaded:", $);
//     console.log("✅ jquery-confirm loaded:", $.confirm);
//     console.log("✅ jquery-ujs loaded:", $.rails);

//     if (!$.rails) {
//       console.error("❌ jquery-ujs is not loaded properly");
//       return;
//     }

//     // Define confirmation dialog logic once
//     $.rails.allowAction = function (link) {
//       if (!link.attr("data-confirm")) {
//         return true;
//       }
//       $.rails.showConfirmDialog(link);
//       return false; // Prevent default action
//     };

//     $.rails.confirmed = function (link) {
//       link.removeAttr("data-confirm");
//       return link.trigger("click.rails");
//     };

//     $.rails.showConfirmDialog = (link) => {
//       console.log("📌 Showing confirmation dialog");
//       $.confirm({
//         title: this.titleValue || "Are you sure?",
//         content: this.contentValue || "This action cannot be undone.",
//         type: "red",
//         icon: "fa-solid fa-triangle-exclamation",
//         buttons: {
//           confirm: {
//             text: this.confirmsValue || "Yes",
//             btnClass: "btn-red",
//             action: function () {
//               $.rails.confirmed(link);
//             },
//           },
//           cancel: {
//             text: this.cancelValue || "No",
//             btnClass: "btn-green",
//           },
//         },
//       });
//     };
//   }

//   process(event) {
//     console.log("🖱️ Button clicked!");
//     event.preventDefault(); // Prevent default delete action

//     let link = $(this.element);
//     if ($.rails.allowAction(link)) {
//       link.removeAttr("data-confirm");
//       link.trigger("click.rails");
//     }
//   }
// }

// import { Controller } from "@hotwired/stimulus";
// import $ from "jquery";

// window.$ = window.jQuery = $;

// window.jQueryUjs = require("jquery-ujs/src/rails.js");
// window.$.rails = window.jQueryUjs;

// window.jQueryConfirm = require("jquery-confirm/dist/jquery-confirm.min.js");
// require("jquery-confirm/dist/jquery-confirm.min.css");
// window.$.confirm = window.jQueryConfirm;

// export default class extends Controller {
//   static values = {
//     title: String,
//     content: String,
//     confirms: String,
//     cancel: String
//   };

//   connect() {
//     console.log("Confirm controller connected");
//     console.log("✅ jQuery Loaded:", $);
//     console.log("✅ jquery-confirm loaded:", $.confirm);
//     console.log("✅ jquery-ujs loaded:", $.rails);
//   }

//   process(event) {
//     event.preventDefault(); // Stop default link action
//     let link = $(this.element);

//     console.log("🖱️ Delete button clicked!");

//     $.confirm({
//       title: this.titleValue || "Are you sure?",
//       content: this.contentValue || "This action cannot be undone.",
//       type: "red",
//       icon: "fa-solid fa-triangle-exclamation",
//       buttons: {
//         confirm: {
//           text: this.confirmsValue || "Yes, Delete!",
//           btnClass: "btn-red",
//           action: function () {
//             console.log("✅ Confirmed, deleting...");
//             link.removeAttr("data-confirm"); // Remove Rails default confirmation
//             link.trigger("click.rails"); // Now trigger the delete action
//           },
//         },
//         cancel: {
//           text: this.cancelValue || "No, keep it!",
//           btnClass: "btn-green",
//           action: function () {
//             console.log("❌ Cancelled deletion.");
//           },
//         },
//       },
//     });
//   }
// }

//<%= link_to "Delete Account", registration_path(resource_name),method: :delete, data: {controller: "confirm",action:"click->confirm#process", confirm_title_value: "Confirm Account Deletion", confirm_content_value: "Are you sure? This action can't be undone!", confirm_confirms_value: "Yes, Delete!", confirm_cancel_value: "No, keep it!", confirm: "You are about to delete account!" }, class: "delete-account-btn" %>
