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
import searchReducer from './reducers/search_reducer'
import projectStatusReducer from './reducers/project_status_reducer'

const reducers = combineReducers({
  deliverables: deliverablesReducer,
  projects: projectsReducer,
  search: searchReducer,
  projectStatus:projectStatusReducer
});
const composeEnhancers = window.__REDUX_DEVTOOLS_EXTENSION_COMPOSE__ || compose;
const middlewares = composeEnhancers(applyMiddleware(reduxPromise));

ReactDOM.render(
  <Provider store={createStore(reducers, {}, middlewares)}>
    <DeliverablesList />
    <ProjectsList />
  </Provider>,
  document.getElementById('root'));
