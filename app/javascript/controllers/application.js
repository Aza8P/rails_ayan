import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = falseclea
window.Stimulus   = application

export { application }

console.log("Hello from application.js")