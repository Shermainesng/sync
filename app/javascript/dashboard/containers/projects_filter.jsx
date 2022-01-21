import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import { loadProjects } from '../actions';



class ProjectsFilter extends Component {

  handleClick(e) {
    this.props.loadProjects({ status: e.target.attributes.value.value, name: "" });
  }

  render() {
    return (
      <div className="d-flex justify-content-between align-items-center mb-4">
        <ul className="filter-bar nav nav-tabs" id="myTab" role="tablist">
          <li role="presentation">
            <a className="nav-link active" data-toggle="tab" value="ongoing" onClick={(e) => this.handleClick(e)}>Ongoing</a>
          </li>
          <li role="presentation">
            <a className="nav-link" data-toggle="tab" value="pending" onClick={(e) => this.handleClick(e)}>Pending</a>
          </li>
          <li role="presentation">
            <a className="nav-link" data-toggle="tab" value="completed" onClick={(e) => this.handleClick(e)}>Completed</a>
          </li>
          <li role="presentation">
            <a className="nav-link" data-toggle="tab" value="saved" onClick={(e) => this.handleClick(e)}>Saved</a>
          </li>
          <li role="presentation">
            <a className="nav-link" data-toggle="tab" value="" onClick={(e) => this.handleClick(e)}>All</a>
          </li>
        </ul>
      </div>
    );
  }
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators(
    { loadProjects: loadProjects },
    dispatch);
}

function mapStateToProps(state) {
  return {
    projects: state.projects
  };
}

export default connect(mapStateToProps, mapDispatchToProps)(ProjectsFilter);
