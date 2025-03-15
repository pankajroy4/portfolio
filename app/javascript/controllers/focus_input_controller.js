import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    this.applyFocusEvents();
    document.addEventListener("turbo:load", this.applyFocusEvents);
  }

  applyFocusEvents = () => {
    this.element.querySelectorAll("input").forEach((input) => {
      input.addEventListener("focus", this.handleFocus);
      input.addEventListener("blur", this.handleBlur);
    });
  };

  handleFocus(event) {
    const input = event.target;
    input.classList.add("focused_input");

    const parentWithError = input.closest(".field_with_errors");
    if (parentWithError) {
      parentWithError.classList.remove("field_with_errors");
    }
  }

  handleBlur(event) {
    event.target.classList.remove("focused_input");
  }

  disconnect() {
    document.removeEventListener("turbo:load", this.applyFocusEvents);
    this.element.querySelectorAll("input").forEach((input) => {
      input.removeEventListener("focus", this.handleFocus);
      input.removeEventListener("blur", this.handleBlur);
    });
  }
}
