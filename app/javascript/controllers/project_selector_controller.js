import { csrfToken } from "@rails/ujs";

import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["option", "input", "submit"]


  filter() {
    this.optionTargets.forEach((el, i) => {
      el.classList.toggle("active", event.target == el)
    })
    this.inputTarget.value = event.target.innerText
    this.submitTarget.disabled = false
  }
}
