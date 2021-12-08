import { csrfToken } from "@rails/ujs";
import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["dropdown", "list", "test", "projects", "Ongoing", "Pending", "Saved", "Completed", "All"]

  connect() {
    console.log("filter here");
    // console.log(`dropwdown target: ${this.dropdownTarget}`);
    // console.log(`list target: ${this.listTarget}`);
    // console.log(`test target: ${this.testTarget}`);
  }

  filterTasks() {
    this.listTarget.innerHTML = "";

    // console.log("fitlering");

    fetch(`deliverables/?deliv_by=${this.dropdownTarget.value}`, {
      headers: { 'Accept': "text/plain" }
    })
      .then((res) => res.text())
      .then((data)=> {
        // console.log(data);
        this.listTarget.innerHTML= data;
      });
  }

  filterProjects() {
    this.projectsTarget.innerHTML="";
    // this.optionTargets.forEach((el, i) => {
    //   el.classList.toggle("active", event.target == el)
    // })
    // this.inputTarget.value = event.target.innerText
    // this.submitTarget.disabled = false

    debugger

    this.filterBy(filter)


  }

  filterBy(filter) {
    fetch(`projects/?status=${filter}`, {
      headers: { 'Accept': "text/plain" }
    })
      .then((res) => res.text())
      .then((data) => {
        // console.log(data);
        this.projectsTarget.innerHTML = data;
      });
  }
}
