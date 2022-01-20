import React from 'react';
import ReactDOM from 'react-dom';
import { Provider } from 'react-redux';
import { createStore, combineReducers, applyMiddleware } from 'redux';
import reduxPromise from 'redux-promise';

// Components
import DeliverablesList from './containers/deliverables_list';
import ProjectsList from './containers/projects_list';

// Reducers
import deliverablesReducer from './reducers/deliverables_reducer'
import projectsReducer from './reducers/projects_reducer'

const reducers = combineReducers({
  deliverables: deliverablesReducer,
  projects: projectsReducer
});

const middlewares = applyMiddleware(reduxPromise);
ReactDOM.render(
  <Provider store={createStore(reducers, {}, middlewares)}>
    <DeliverablesList />
    <ProjectsList />
  </Provider>,
  document.getElementById('deliverables'));
