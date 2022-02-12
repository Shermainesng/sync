import React from 'react';
import {Link, Outlet} from 'react-router-dom';
import DeliverablesList from '../containers/deliverables_list';
import ProjectsList from '../containers/projects_list';

function Dashboard(props) {
  return (
    <>
      <Link to="/projects/27">LINK HERE to SHOW project 27</Link>
      <DeliverablesList />
      <ProjectsList />
    </>
  );
}

export default Dashboard;
