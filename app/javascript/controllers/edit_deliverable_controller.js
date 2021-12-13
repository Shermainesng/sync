/**
 * Stimulus controller
 * Documentation: https://stimulus.hotwired.dev/
 * read more about lifecyles at https://stimulus.hotwired.dev/reference/lifecycle-callbacks
 */
import { csrfToken } from "@rails/ujs";

import { Controller } from "stimulus";

import Swal from 'sweetalert2'

export default class extends Controller {
  static targets = ["delete", "details", "edit", "form", "tab"];
  static values = {
    path: String
  }

  connect() {
    // Anytime the controller is connected to the DOM
    console.log("edit deliverable Controller Connected!");
  }

  delete() {
    console.log("deleting");

    Swal.fire({
      title: 'Are you sure?',
      text: "You won't be able to revert this!",
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#94B3FD',
      cancelButtonColor: '#bdbdbd',
      confirmButtonText: 'Yes, delete it!'
    }).then((result) => {
      if (result.isConfirmed) {
        Swal.fire(
          'Deleted!',
          'Your file has been deleted.',
          'success'
        )

        fetch(this.deleteTarget.dataset.href, {
          method: 'DELETE',
          headers: { 'Accept': 'text/plain', 'X-CSRF-Token': csrfToken()  } })
          .then(response => response.text())
          .then((data) => {
            console.log(data);
            this.detailsTarget.innerHTML = ""
            this.detailsTarget.classList.toggle("d-none")
          })

      }
    })

  }



  edit() {
    this.tabTarget.classList.toggle("d-none")
  }

  update(e){
    e.preventDefault();

    fetch(this.formTarget.action, {
      method: 'PATCH',
      headers: { 'Accept': "text/plain", 'X-CSRF-Token': csrfToken() },
      body: new FormData(this.formTarget)
      // goes to deliverablescontroller#update
      // save the deliverable under the project there
      //fetch all the deliverables back
    })
      .then(response => response.text())
      .then((data) => {
        // when the response comes back

        // clear the form
        this.formTarget.reset();

        console.log(data);
        // fill up the list with the deliverables (sorted)
        console.log(this.detailsTarget.innerHTML);
        this.detailsTarget.outerHTML = data;
        this.tabTarget.classList.toggle("d-none");

        console.log("update deliverable");
      });
  }

  cancel() {
    this.tabTarget.classList.toggle("d-none")
  }

}
