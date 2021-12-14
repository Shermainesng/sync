import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["email", "button"]

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

}
