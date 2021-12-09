/**
 * Stimulus controller
 * Documentation: https://stimulus.hotwired.dev/
 * read more about lifecyles at https://stimulus.hotwired.dev/reference/lifecycle-callbacks
 */
import { csrfToken } from "@rails/ujs";

import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["form", "receiving", "newReply", "list", "replyForm"];

  connect() {
    console.log("hello from insert-comments-controller!");
  }

  createDeliverable(e) {
    e.preventDefault();
    fetch(this.formTarget.action, {
      method: 'POST',
      headers: { 'Accept': "text/plain", 'X-CSRF-Token': csrfToken() },
      body: new FormData(this.formTarget)
    })
      .then(response => response.text())
      .then((data) => {
        this.formTarget.reset();
        this.listTarget.insertAdjacentHTML("beforeend", data);
        console.log("created comment");
      });
  }

  newReply(e){
    // debugger
    debugger
    e.target.closest("form").classList.toggle("d-none")
  }

  createReply(e){
    e.preventDefault();
    console.log("creating Reply");
    fetch(this.replyFormTarget.action, {
      method: 'POST',
      headers: { 'Accept': "text/plain", 'X-CSRF-Token': csrfToken() },
      body: new FormData(this.replyFormTarget)}
      )
      .then(response => response.text())
      .then((data) => {
        console.log("this is the data:", data)
        debugger;
        const commentCard = e.target.parentElement;
        e.target.classList.add('d-none');

        commentCard.insertAdjacentHTML('beforeend', data);
      });
  }
}
