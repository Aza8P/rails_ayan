import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["type"];

  connect() {
    console.log("Hello Two Way!")
  }

  toggle(event) {
    const selected = event.currentTarget.value;
    const type = this.typeTarget;

    if(selected === "OW") {
     type.value = false;
    } else if (selected === "RT") {
     type.value = true;
    }
    console.log(selected, type.value)
  }
}
