import React, { Component }from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import Deliverable from '../components/deliverable';
import Message from '../components/message';
import Select from '../containers/select';
import { loadDeliverables } from '../actions';

class DeliverablesList extends Component{

  componentDidMount() {
    this.props.loadDeliverables("week");
  }

  renderList(deliverables) {
    return deliverables.map(deliv => <Deliverable deliverable={deliv} key={deliv.id} />)
  }

  render(){
    const deliverablesEmpty = this.props.deliverables.length === 0
    return(
      <div className="upcoming-tasks card-white">
        <div className="header-lg">Upcoming Tasks
          <Select />
        </div>
        <div className="action-panel section">
          <ul className="action-bar-categories">
            <li>Due Date</li>
            <li>Brand</li>
            <li>Campaign</li>
            <li>Deliverable</li>
            <li>Tags</li>
          </ul>
          <ul className="action-bar-list">
            {deliverablesEmpty ? <Message content="Nothing due!" /> : this.renderList(this.props.deliverables)}
          </ul>
        </div>
      </div>
    );
  }
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators(
    { loadDeliverables: loadDeliverables },
    dispatch);
}

function mapStateToProps(state) {
  return {
    deliverables: state.deliverables
  };
}

export default connect(mapStateToProps, mapDispatchToProps)(DeliverablesList);
