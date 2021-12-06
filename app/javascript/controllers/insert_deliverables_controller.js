// Visit The Stimulus Handbook for more details
// https://stimulusjs.org/handbook/introduction
//
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "form","list"]

  connect() {
    console.log('hello there');
    console.log(this.formTarget);
    console.log(this.listTarget);
  }

  createDeliverable(e) {
    e.preventDefault();
    // send the form data to the server
    // save the deliverable under the new project
    // when the response comes back
    // clear the form
    // Add the html for the newly created deliverable in the listTarget

    //AJAX request, format.json
  }
}
