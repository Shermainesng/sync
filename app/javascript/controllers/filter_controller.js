import { csrfToken } from "@rails/ujs";
import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["dropdown", "list", "test"]

  connect() {
    console.log("filter here");
    // console.log(`dropwdown target: ${this.dropdownTarget}`);
    // console.log(`list target: ${this.listTarget}`);
    // console.log(`test target: ${this.testTarget}`);
  }

  filterTasks() {
    this.listTarget.innerHTML = "";

    console.log("fitlering");

    fetch(`deliverables/?deliv_by=${this.dropdownTarget.value}`, {
      method: 'GET',
      headers: { 'Accept': "text/plain", 'X-CSRF-Token': csrfToken() }
    })
      .then((res)=> {res.text()})
      .then((data)=> {
        console.log("reached data");
        this.listTarget.innerHTML= data;
      });
  }
}
