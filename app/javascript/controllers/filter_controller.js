import { csrfToken } from "@rails/ujs";
import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["dropdown", "list", "projects", "status"]

  connect() {
    console.log("filter here");
    // console.log(`dropwdown target: ${this.dropdownTarget}`);
    // console.log(`list target: ${this.listTarget}`);
    // console.log(`test target: ${this.testTarget}`);
  }


  filterTasks() {
    this.listTarget.innerHTML = "";

    fetch(`deliverables/?deliv_by=${this.dropdownTarget.value}`, {
      headers: { 'Accept': "text/plain" }
    })
      .then((res) => res.text())
      .then((data)=> {
        this.listTarget.innerHTML= data;
      });
  }

  filterProjects(event) {
    this.projectsTarget.innerHTML="";
    let url = ""

    if (event.currentTarget.innerText !== "All") {
      url = `projects/?deliv_by=${event.currentTarget.innerText}`
    } else {
      url = 'projects'
    }

    fetch(url, {
        headers: { 'Accept': "text/plain" }
      })
        .then((res) => res.text())
        .then((data) => {
          // console.log(data);
          this.projectsTarget.innerHTML = data;
        });
    }
}
