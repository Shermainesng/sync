import { csrfToken } from "@rails/ujs";

import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "form", "list", "edit", "link" ]

  createDeliverable(e) {
    e.preventDefault();
    // send the form data to the server
    fetch(this.formTarget.action, {
      method: 'POST',
      headers: { 'Accept': "text/plain", 'X-CSRF-Token': csrfToken() },
      body: new FormData(this.formTarget)
      // goes to controller in ruby here!!tes
      // save the deliverable under the project
    })
      .then(response => response.text())
      .then((data) => {
        // when the response comes back

        // clear the form
        this.formTarget.reset();
        // Add the html for the newly created deliverable in the listTarget
        this.listTarget.insertAdjacentHTML("beforeend",data);

        //testing
        // console.log(data);
        console.log("created deliverable");

      });
  }

  edit(e) {
    // e.preventDefault();
    const link = e.target.closest("a")
    this.editTarget.classList.toggle("d-none")

    fetch(link.dataset.href,
      { headers: { 'Accept': 'text/plain' } })
      .then(response => response.text())
      .then((data) => {
        this.editTarget.innerHTML = data
        console.log(this.editTarget);
      })
  }

  cancel(e) {
    e.preventDefault()
    this.editTarget.classList.toggle("d-none")
  }
}


    //AJAX request, format.json
