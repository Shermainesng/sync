import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import { loadDeliverables } from '../actions';

class Select extends Component {

  handleChange(e) {
    this.props.loadDeliverables(e.target.value);
  }

  render() {
    return (
      <select className="dropdown-custom" onChange={(e) => this.handleChange(e)}>
        <option value="week">in the next week</option>
        <option value="two_weeks">in the next two weeks</option>
        <option value="month">in the next month</option>
      </select>
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

export default connect(mapStateToProps, mapDispatchToProps)(Select);
