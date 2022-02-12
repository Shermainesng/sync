import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import { useParams } from 'react-router-dom';
import { fetchProject } from '../actions/index';

import FrostedCard from './frostedcard';
import ProjectHeader from '../containers/project_header';

function EditProject(props) {
    const params = useParams();
    const project = props.projects.find(p => p.id === params.projectId);

    return(
      <FrostedCard classes="my-3 p-3">
        {/* <DeliverablesList/> */}
        <ProjectHeader proj={project}/>
      </FrostedCard>
    );
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ fetchProject }, dispatch);
}

function mapStateToProps(state) {
  return { projects: state.projects };
}
export default connect(mapStateToProps, mapDispatchToProps)(EditProject);
