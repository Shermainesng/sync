import React, { Component } from 'react';
import Deliverable from 'deliverable';

class DeliverableList extends Component {
  constructor(props) {
    super(props);
    this.state = {
      deliverables: null
    };
  }

  render() {
    return (
      <ul>
        {this.state.deliverables.map((deliverable) => <Deliverable deliverable={deliverable} key={deliverable.id}/>)}
      </ul>
    );
  }
}

export default DeliverableList;
