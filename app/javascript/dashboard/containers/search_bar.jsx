import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import { loadProjects, updateSearch } from '../actions';



class SearchBar extends Component {

  handleChange(e) {
    this.props.updateSearch(e.target.value);
    setTimeout(() => {
      this.props.loadProjects({ status: this.props.projectStatus, name: this.props.search });
    }, 2000);
  }

  render() {
    return (
      <input type="text" value={this.props.search} onChange={(e)=> this.handleChange(e)} />
    );
  }
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators(
    {
      loadProjects: loadProjects,
      updateSearch: updateSearch
    },
    dispatch);
}

function mapStateToProps(state) {
  return {
    search: state.search,
    projectStatus: state.projectStatus
  };
}

export default connect(mapStateToProps, mapDispatchToProps)(SearchBar);
