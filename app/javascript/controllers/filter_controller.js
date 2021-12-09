import { csrfToken } from "@rails/ujs";
import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["dropdown", "deliverables", "projects", "input"]

  connect () {
    console.log("filter connected");
  }

  filterTasks() {
    this.deliverablesTarget.innerHTML = "";

    fetch(`deliverables?deliv_by=${this.dropdownTarget.value}`, {
      headers: { 'Accept': "text/plain" }
    })
      .then((res) => res.text())
      .then((data)=> {
        this.deliverablesTarget.innerHTML= data;
      });
  }


  initialize() {
    this.timer
  }

  filterProjects() {
    clearTimeout(this.timer);

    this.timer = setTimeout(() => {
      debugger
      this.projectsTarget.innerHTML = "";

      fetch(`projects?&filter_name=${this.inputTarget.value}`, {
        headers: { 'Accept': "text/plain" }
      })
        .then((res) => res.text())
        .then((data) => {
          this.projectsTarget.innerHTML = data;
        });

    }, 500);

    }
}
