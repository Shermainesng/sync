/**
 * Stimulus controller
 * Documentation: https://stimulus.hotwired.dev/
 * read more about lifecyles at https://stimulus.hotwired.dev/reference/lifecycle-callbacks
 */
import { csrfToken } from "@rails/ujs";

import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["form", "replies", "newReply", "submit", "viewMore"];

  connect() {
    console.log("hello from insert-comments-controller!");
  }

  newReply(){
    console.log(this.newReplyTarget)
    this.formTarget.classList.toggle("d-none");
    this.newReplyTarget.classList.toggle("d-none");
  }

  createReply(e){
    e.preventDefault();
    console.log("creating Reply");
    fetch(this.formTarget.action, {
      method: 'POST',
      headers: { 'Accept': "text/plain", 'X-CSRF-Token': csrfToken() },
      body: new FormData(this.formTarget)}
      )
      .then(response => response.text())
      .then((data) => {
        this.repliesTarget.insertAdjacentHTML("beforeend", data);
        this.newReplyTarget.classList.toggle("d-none");
        this.formTarget.reset();
        this.formTarget.classList.toggle("d-none");
        this.submitTarget.disabled=false;
      });
  }

  viewReplies() {
    if (this.repliesTarget.classlist != null) {
      this.repliesTarget.classlist.toggle("d-none");
    }
    if (this.viewMoreTarget.classlist != null) {
      this.viewMoreTarget.classList.toggle("d-none");
    }

  }
}
