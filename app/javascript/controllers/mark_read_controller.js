import { csrfToken } from "@rails/ujs";

import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["notif", "trash"]

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

  destroy(e) {
    e.preventDefault()

    const destroy_notif_id = this.trashTarget.dataset.value
    const path = `/notifications/${destroy_notif_id}`

    fetch(path, {
      method: 'DELETE',
      headers: { 'X-CSRF-Token': csrfToken() }
    }).then(response => response.html())
      .then((data) => {
        console.log(data);
        console.log("deleted notif");
      });
  }
}
