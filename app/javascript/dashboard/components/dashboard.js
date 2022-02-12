import React from 'react';
import {Link, Outlet} from 'react-router-dom';
import DeliverablesDashboard from '../containers/deliverables_dashboard';
import ProjectsList from '../containers/projects_list';

function Dashboard(props) {
  return (
    <>
      <Link to="/projects/27">LINK HERE to SHOW project 27</Link>
      <DeliverablesDashboard />
      <ProjectsList />
    </>
  );
}

export default Dashboard;
