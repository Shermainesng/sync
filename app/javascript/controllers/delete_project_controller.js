import { csrfToken } from "@rails/ujs";

import { Controller } from "stimulus"

import Swal from 'sweetalert2'

export default class extends Controller {
  static targets = ["option", "input", "submit", "delete", "content", "link", "card"]


  filter() {
    this.optionTargets.forEach((el, i) => {
      el.classList.toggle("active", event.target == el)
    })
    this.inputTarget.value = event.target.innerText
    this.submitTarget.disabled = false
  }

  deleteProject(e) {
    e.preventDefault();
    console.log(this.linkTarget);

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

        fetch(this.deleteTarget.attributes.value.value, {
          method: 'DELETE',
          headers: { 'Accept': 'text/plain', 'X-CSRF-Token': csrfToken()  } })
          .then(response => response.text())
          .then((data) => {
            this.contentTarget.innerHTML = "Project deleted"
            // debugger
            // document.getElementById("link").removeAttribute("href")
            // this.linkTarget.classList.add('disabled')

            this.linkTarget.href = ""
            this.contentTarget.classList.add('show-delete-content')
            this.contentTarget.classList.remove("card-white")
            this.cardTarget.classList.remove('card-animation')
          })
      }
    })
  }

}
