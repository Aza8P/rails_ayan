import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "train", "flight", "hotel"]

  connect() {
    this.trainTarget.style.display = "block";
  };

  toggle(event) {
    const selectedOption = event.currentTarget.dataset.option;
    console.log("selected", event.target.dataset.option)
    this.hideAll();
    
    switch (selectedOption) {
      case "train":
        this.trainTarget.style.display = "block";
        break;
      case "flight":
        this.flightTarget.style.display = "block";
        break;
      case "hotel":
        this.hotelTarget.style.display = "block";
        break;
    }
  }
  hideAll() {
    this.trainTarget.style.display = "none";
    this.flightTarget.style.display = "none";
    this.hotelTarget.style.display = "none";
  }
}
