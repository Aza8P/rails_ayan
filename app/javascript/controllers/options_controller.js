import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "train", "flight", "hotel"]

  connect() {
    this.trainTarget.style.display = "block";
    this.trainButton.classList.add("selected")
  };

  toggle(event) {
    const selectedOption = event.currentTarget.dataset.option;
    console.log("selected", event.target.dataset.option)
    this.hideAll();
    
    switch (selectedOption) {
      case "train":
        this.trainTarget.style.display = "block";
        this.trainButton.classList.add("selected");
        break;
      case "flight":
        this.flightTarget.style.display = "block";
        this.flightButton.classList.add("selected");
        break;
      case "hotel":
        this.hotelTarget.style.display = "block";
        this.hotelButton.classList.add("selected");
        break;
    }
  }
  hideAll() {
    this.trainTarget.style.display = "none";
    this.flightTarget.style.display = "none";
    this.hotelTarget.style.display = "none";
    this.trainButton.classList.remove("selected");
    this.flightButton.classList.remove("selected");
    this.hotelButton.classList.remove("selected");
  }
}
