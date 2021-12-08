import { csrfToken } from "@rails/ujs";
import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ['form', 'input', 'list'];

  connect() {
    console.log(this.listTarget);
  }

  update() {
    this.listTarget.innerHTML = "";
    const url = `projects/?query=${this.inputTarget.value}`
    fetch(url, {
      headers: { 'Accept': 'text/plain' }
    })
      .then(response => response.text())
      .then((data) => {
        // this.listTarget.innerHTML = @;
        console.log(data);
  }
//
}
