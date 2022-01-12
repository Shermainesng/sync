// Load all the components within this directory
import DeliverableList from "deliverable_list.jsx"

const root = document.getElementById('deliverable-list');

if (root) {
  console.log("mounted");
  ReactDOM.render(
    DeliverableList,
    root
  );
}
