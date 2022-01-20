import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';


class ProjectsFilter extends Component {

  // handleChange(e) {
  //   this.props.loadDeliverables(e.target.value);
  // }

  render() {
    return (
      <div className="d-flex justify-content-between align-items-center mb-4">
        <ul className="filter-bar nav nav-tabs" id="myTab" role="tablist">
          <li role="presentation">
            <a className="nav-link active" data-toggle="tab" value="ongoing">Ongoing</a>
          </li>
          <li role="presentation">
            <a className="nav-link" data-toggle="tab" value="pending">Pending</a>
          </li>
          <li role="presentation">
            <a className="nav-link" data-toggle="tab" value="completed">Completed</a>
          </li>
          <li role="presentation">
            <a className="nav-link" data-toggle="tab" value="saved">Saved</a>
          </li>
          <li role="presentation">
            <a className="nav-link" data-toggle="tab" value="all">All</a>
          </li>
        </ul>
      </div>
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

// export default connect(mapStateToProps, mapDispatchToProps)(ProjectsFilter);
export default ProjectsFilter;
