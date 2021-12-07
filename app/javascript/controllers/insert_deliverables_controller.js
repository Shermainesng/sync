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
      // goes to controller in ruby here!!tes
      // save the deliverable under the project
    })
      .then(response => response.json())
      .then((data) => {
        // when the response comes back

        // clear the form
        this.formTarget.reset();
        // Add the html for the newly created deliverable in the listTarget
        this.listTarget.insertAdjacentHTML("beforeend",data);

        //testing
        console.log(data);
        console.log("created deliverable");

      });
  }
}


    //AJAX request, format.json
