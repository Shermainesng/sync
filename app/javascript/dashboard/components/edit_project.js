import React, { Component } from "react";
import { bindActionCreators } from "redux";
import { connect } from "react-redux";
import { useParams } from "react-router-dom";
import { fetchProject } from "../actions/index";

import FrostedCard from "./frostedcard";
import ProjectHeader from "../containers/project_header";
// import DeliverablesList from './deliverables_list';

function EditProject(props) {
  const id = useParams().projectId;
  const project = props.fetchProject(id);

  return (
    <FrostedCard classes="my-3 p-3">
      {/* <DeliverablesList/> */}
      <ProjectHeader proj={project} />
      <DeliverablesList projectId={id} />
    </FrostedCard>
  );
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ fetchProject }, dispatch);
}

function mapStateToProps(state) {
  return { project: state.selectedProject };
}
export default connect(mapStateToProps, mapDispatchToProps)(EditProject);
