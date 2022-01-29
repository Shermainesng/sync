import { csrfToken } from "@rails/ujs";
import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["dropdown", "admin", "collaborator"];

  updateRoles(e) {
    const path = `/roles/${this.dropdownTarget.dataset.value}`
    const selected = this.dropdownTarget.options.selectedIndex

    console.log(path);
    console.log(selected);

    // console.log(this.dropdownTarget);
    // debugger

    fetch(path, {
      method: 'PATCH',
      headers: { 'X-CSRF-Token': csrfToken() },
      body: selected
    })
      .then(response => response.text())
      .then((data) => {
        console.log("update role");

        // if (this.dropdownTarget.options.selectedIndex == 0) {
        //   console.log(this.adminTarget);
        // }
      });
  }

}

// this.dropdownTarget.options.selectedIndex
