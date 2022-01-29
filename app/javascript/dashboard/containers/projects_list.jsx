import React, { Component }from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import Project from '../components/project';
import Message from '../components/message';
import ProjectsFilter from '../containers/projects_filter';
import SearchBar from './search_bar';
import { loadProjects, filterStatus } from '../actions';

class ProjectsList extends Component{

  componentDidMount() {
    this.props.filterStatus("ongoing");
  }

  componentDidUpdate(prevProps) {
    if (prevProps.projectStatus != this.props.projectStatus) {
      this.props.loadProjects({status: this.props.projectStatus, name: ""});
    }
  }

  renderList(projects) {
    return projects.map(project => <Project proj={project} key={project.id} />)
  }

  render(){
    const projectsEmpty = this.props.projects.length === 0

    return(
      <div className='card-frosted my-3 p-4 projects'>
        <div className="d-flex justify-content-between align-items-center mb-4">
          <ProjectsFilter />
          <SearchBar />
        </div>
        <div className="row projects-results">
          {projectsEmpty ? <Message content="Nothing here!" /> : this.renderList(this.props.projects)}
        </div>
      </div>
    );
  }
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators(
    {
      loadProjects: loadProjects,
      filterStatus: filterStatus
    },
    dispatch);
}

function mapStateToProps(state) {
  return {
    projects: state.projects,
    projectStatus: state.projectStatus
  };
}

export default connect(mapStateToProps, mapDispatchToProps)(ProjectsList);
