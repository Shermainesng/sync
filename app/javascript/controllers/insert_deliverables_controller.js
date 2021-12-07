// Visit The Stimulus Handbook for more details
// https://stimulusjs.org/handbook/introduction
//
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>
import { csrfToken } from "@rails/ujs";

import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "form","list"]

  connect() {
    console.log('insert deliverables controller here');

  }

  createDeliverable(e) {
    e.preventDefault();
    // send the form data to the server
    fetch(this.formTarget.action, {
      method: 'POST',
      headers: { 'Accept': "application/json", 'X-CSRF-Token': csrfToken() },
      body: new FormData(this.formTarget)
      // goes to controller in ruby here!!
      // save the deliverable under the new project
    })
      .then(response => response.json())
      .then(() => {
        console.log("created deliverable");
      });
  }
}

    // when the response comes back
    // clear the form
    // Add the html for the newly created deliverable in the listTarget

    //AJAX request, format.json
