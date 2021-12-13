import { csrfToken } from "@rails/ujs";
import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["dropdown", "deliverables", "projects", "input", "form", "status"]

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

  searchProjects() {
    clearTimeout(this.timer);
    this.timer = setTimeout(() => {
      fetch(`projects?&filter_name=${this.inputTarget.value}`, {
        headers: { 'Accept': "text/plain" }
      })
        .then((res) => res.text())
        .then((data) => {
          this.projectsTarget.innerHTML = data;
        });

    }, 500);
  }

  filterProjects(e) {
    let status = e.currentTarget.innerText;
    // e.currentTarget.classList.toggle("disabled");

    if (status === "All") {
      status = "";
    }
    this.formTarget.reset();

    fetch(`projects?&status=${status}`, {
      headers: { 'Accept': "text/plain" }
    })
      .then((res) => res.text())
      .then((data) => {
        this.projectsTarget.innerHTML = data;
      });
  }

  prevent(e) {
    e.preventDefault();
    console.log("preventing");
  }
}
