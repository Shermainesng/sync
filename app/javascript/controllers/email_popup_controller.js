import { Controller } from "stimulus"
import { csrfToken } from "@rails/ujs";

export default class extends Controller {
  static targets = ["email", "button", "emailBtn"]

  toggle(e) {
    this.emailTarget.classList.toggle("d-none")
    this.buttonTarget.classList.toggle("d-none")
  }

  show(e) {
    if (this.emailTarget.classList.contains("d-none")) {
      this.emailTarget.classList.remove('d-none')
      this.buttonTarget.classList.add('d-none')
    }
  }

  updateStatus() {
    fetch(`/projects/${this.emailBtnTarget.value}/sent`, {
      headers: { 'Accept': "text/plain", 'X-CSRF-Token': csrfToken() },
    })
    .then(response => response.text())
    .then((data) => {
      console.log('updated');
    });
  }

}
