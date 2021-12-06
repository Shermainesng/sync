
import { csrfToken } from "@rails/ujs";

import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["brand", "projectName", "description", "form"]

  connect() {
    console.log("con");
  }

  updateProject(e) {
    // e.preventDefault();

    fetch(this.formTarget.action, {
      method: 'PATCH',
      headers: { 'Accept': "application/json", 'X-CSRF-Token': csrfToken() },
      body: new FormData(this.formTarget)
      // goes to controller in ruby here!!
    })
      .then(response =>response.json())
      .then(() => {
        console.log("updated");
      });

  }
}
