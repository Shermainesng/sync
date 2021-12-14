import { csrfToken } from "@rails/ujs";

import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["option", "input", "submit"]


  filter() {
    this.optionTargets.forEach((el, i) => {
      el.classList.toggle("active", event.target == el)
    })
    this.inputTarget.value = event.target.innerText
    this.submitTarget.disabled = false
  }

  // deleteProject () {
  //   console.log("deleting");
  //   console.log(this.deleteTarget);

    // Swal.fire({
    //   title: 'Are you sure?',
    //   text: "You won't be able to revert this!",
    //   icon: 'warning',
    //   showCancelButton: true,
    //   confirmButtonColor: '#94B3FD',
    //   cancelButtonColor: '#bdbdbd',
    //   confirmButtonText: 'Yes, delete it!'
    // }).then((result) => {
    //   if (result.isConfirmed) {
    //     Swal.fire(
    //       'Deleted!',
    //       'Your file has been deleted.',
    //       'success'
    //     )

        // fetch(this.deleteTarget.dataset.href, {
        //   method: 'DELETE',
        //   headers: { 'Accept': 'text/plain', 'X-CSRF-Token': csrfToken() }
        // })
        //   .then(response => response.text())
        //   .then((data) => {
        //     this.detailsTarget.innerHTML = ""
        //     this.detailsTarget.classList.toggle("d-none")
        //   })

    //   }
    // })

  // }
}
