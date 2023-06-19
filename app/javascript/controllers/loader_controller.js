import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["loader"];

  connect() {
  }

  displayLoader() {
    console.log("ok")
    console.log(this.loaderTarget.classList)
    this.loaderTarget.classList.remove("d-none");
    console.log(this.loaderTarget.classList)
  }
}
