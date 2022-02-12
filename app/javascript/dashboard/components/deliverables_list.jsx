import React, { Component }from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import { loadProjectDeliverables } from '../actions';
import DetailedDeliverable from './detailed_deliverable';
import Message from './message';

class DeliverablesList extends Component{

  componentDidMount() {
    this.props.loadProjectDeliverables(this.props.projectId);
  }

  renderList(deliverables) {
    return deliverables.map(deliv => <DetailedDeliverable deliverable={deliv} key={deliv.id} />)
  }

  render(){
    const deliverablesEmpty = this.props.deliverables.length === 0
    return(
      <ul className="custom-list" >
        {deliverablesEmpty ? <Message content="No deliverables added yet" /> : this.renderList(this.props.deliverables)}
      </ul>
    );
  }
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators(
    { loadProjectDeliverables: loadProjectDeliverables },
    dispatch);
}

function mapStateToProps(state) {
  return {
    deliverables: state.deliverables
  };
}

export default connect(mapStateToProps, mapDispatchToProps)(DeliverablesList);
