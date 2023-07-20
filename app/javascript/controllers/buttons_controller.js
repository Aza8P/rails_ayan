import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["oneWayRadio", "twoWayRadio"];

  connect() {
    console.log("Hello Buttons!")
  }

  toggleRadioButtons() {
    preventDefault();
    if (this.oneWayRadioTarget.checked) {
      this.twoWayRadioTarget.disabled = true;
    } else {
      this.twoWayRadioTarget.disabled = false;
    }

    if (this.twoWayRadioTarget.checked) {
      this.oneWayRadioTarget.disabled = true;
    } else {
      this.oneWayRadioTarget.disabled = false;
    }
  }
}
