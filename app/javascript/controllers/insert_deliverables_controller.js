import { csrfToken } from "@rails/ujs";

import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [ "form", "list", "edit", "link", "message" ]
  connect (){
    // console.log("insert deliverables controller");
  }

  createDeliverable(e) {
    e.preventDefault();

    // send the form data to the server
    fetch(this.formTarget.action, {
      method: 'POST',
      headers: { 'Accept': "text/plain", 'X-CSRF-Token': csrfToken() },
      body: new FormData(this.formTarget)
      // goes to deliverablescontroller#create
      // save the deliverable under the project there
      //fetch all the deliverables back
    })
      .then(response => response.text())
      .then((data) => {
        // when the response comes back

        // clear the form
        this.formTarget.reset();

        // fill up the list with the deliverables (sorted)
        this.listTarget.innerHTML = data;
        this.messageTarget.innerHTML ="";

        console.log("created deliverables");
      });
  }

}


    //AJAX request, format.json
