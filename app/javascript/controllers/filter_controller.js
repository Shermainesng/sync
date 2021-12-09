import { csrfToken } from "@rails/ujs";
import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["dropdown", "deliverables", "projects", "input", "form"]

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
      console.log(`input Target: ${this.inputTarget}`);
      console.log(this.inputTarget);

      console.log(`project Target:`);
      console.log(this.projectsTarget.innerHTML);


      const url = `${this.formTarget.action}?query=${this.inputTarget.value}`

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
