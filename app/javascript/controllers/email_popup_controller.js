import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["email", "button"]

  toggle(e) {
    this.emailTarget.classList.toggle('d-none')
    this.buttonTarget.classList.toggle('d-none')
  }
}
