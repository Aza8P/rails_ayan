import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    // console.log("Hello from hello_controller.js, connect")
    this.element.textContent = "Hello World!"
  }
}

console.log("Hello from hello_controller.js")