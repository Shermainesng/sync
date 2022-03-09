import React, { Component } from "react";
import { Link, Outlet } from "react-router-dom";
// import { bindActionCreators } from 'redux';
// import { connect } from 'react-redux';

import DeliverablesList from '../components/deliverables_list';
import FrostedCard from '../components/frostedcard';

class ShowProject extends Component {
  componentDidMount() {}

  render() {
    return (
      <FrostedCard classes="my-3 p-3">
        {/* <DeliverablesList/> */}
        <Link to="/projects/27/edit">LINK HERE to edit PROJECT 27</Link>
        <Outlet />
      </FrostedCard>
    );
  }
}

// function mapDispatchToProps(dispatch) {
//   return bindActionCreators(
//     { loadDeliverables: loadDeliverables },
//     dispatch);
// }

// function mapStateToProps(state) {
//   return {
//     deliverables: state.deliverables
//   };
// }
// connect(mapStateToProps, mapDispatchToProps)
export default ShowProject;
