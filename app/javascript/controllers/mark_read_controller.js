import { csrfToken } from "@rails/ujs";

import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["notif"]

  markAsRead(){
    const notif_id = this.notifTarget.dataset.value
    const path = `/notifications/${notif_id}`
    // debugger

    fetch(path, {
      method: 'PATCH',
      headers: { 'X-CSRF-Token': csrfToken() }
    }).then(response => response.text())
      .then((data) => {
        console.log(data);
        console.log("updated notif");
      });
  }

}
