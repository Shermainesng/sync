import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["commentForm", "button", "emailBodyField", "roleField", "collaboratorsList", "dropdown"];

  connect() {
    console.log("hello from toggle controller!");
  }

  newComment() {
    this.commentFormTarget.classList.toggle("d-none");
    this.buttonTarget.classList.toggle("d-none");
  }

  show() {
    this.emailBodyFieldTarget.classList.remove("d-none")
    this.roleFieldTarget.classList.remove("d-none")
    this.collaboratorsListTarget.classList.add("d-none")
  }

  hide() {
    this.emailBodyFieldTarget.classList.add("d-none")
    this.roleFieldTarget.classList.add("d-none")
    this.collaboratorsListTarget.classList.remove("d-none")
  }

}
