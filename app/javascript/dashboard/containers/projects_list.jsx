import React, { Component }from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import Project from '../components/project';
import Message from '../components/message';
import ProjectsFilter from '../containers/projects_filter';
import { loadProjects } from '../actions';

class ProjectsList extends Component{

  componentDidMount() {
    this.props.loadProjects({status: "", name: ""});
  }

  renderList(projects) {
    return projects.map(project => <Project proj={project} key={project.id} />)
  }

  render(){
    const projectsEmpty = this.props.projects.length === 0

    return(
      <div className='card-frosted my-3 p-4 projects'>
        <ProjectsFilter />
        <div className="row projects-results">
          {projectsEmpty ? <Message content="Nothing here!" /> : this.renderList(this.props.projects)}
        </div>
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

export default connect(mapStateToProps, mapDispatchToProps)(ProjectsList);
