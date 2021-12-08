import { csrfToken } from "@rails/ujs";
import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["dropdown", "list", "projects", "status"]


  filterTasks() {
    this.listTarget.innerHTML = "";

    fetch(`deliverables?deliv_by=${this.dropdownTarget.value}`, {
      headers: { 'Accept': "text/plain" }
    })
      .then((res) => res.text())
      .then((data)=> {
        this.listTarget.innerHTML= data;
      });
  }

  filterProjects(event) {
    this.projectsTarget.innerHTML="";
    debugger
    const status =  event.currentTarget.value
    const name = this.inputTarget.value

    fetch(`projects?filter_status=${status}&filter_name=${name}`, {
        headers: { 'Accept': "text/plain" }
      })
        .then((res) => res.text())
        .then((data) => {
          // console.log(data);
          this.projectsTarget.innerHTML = data;
        });
    }
}

// update() {
//   this.listTarget.innerHTML = "";
//   const url = `projects/?query=${this.inputTarget.value}`
//   fetch(url, {
//     headers: { 'Accept': 'text/plain' }
//   })
//     .then(response => response.text())
//     .then((data) => {
//       console.log(data);
//     });
// }
