import React from 'react';
import {Link, Outlet} from 'react-router-dom';
import DeliverablesDashboard from '../containers/deliverables_dashboard';
import ProjectsList from '../containers/projects_list';

function Dashboard(props) {
  return (
    <>
      <DeliverablesDashboard />
      <ProjectsList />
    </>
  );
}

export default Dashboard;
