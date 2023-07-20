import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "train", "flight", "hotel", "travelType"]

  connect() {
    this.trainTarget.style.display = "block";
    this.travelTypeTarget.value = "train";
    // this.btnradioTargets[0].checked = true;
    console.log("connected", this.travelTypeTarget.value)
  };

  toggle(event) {
    const selectedOption = event.target.dataset.option;
    console.log("selected", event.target.dataset.option)
    this.hideAll();

    this.travelTypeTarget.value = selectedOption;
    
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
