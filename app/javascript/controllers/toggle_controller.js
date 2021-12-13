
import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["commentForm"];

  connect() {
    console.log("hello from toggle controller!");
  }

  newComment() {
    this.commentFormTarget.classList.toggle("d-none");
  }
}
