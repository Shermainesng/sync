import React from 'react';
import ReactDOM from 'react-dom';
import { Provider } from 'react-redux';
import { createStore, combineReducers, applyMiddleware } from 'redux';
import reduxPromise from 'redux-promise';
import { BrowserRouter, Routes, Route } from "react-router-dom";

// Components
import Dashboard from './components/dashboard';
import EditProject from './components/edit_project';
import ShowProject from './containers/show_project';

// Reducers
import deliverablesReducer from './reducers/deliverables_reducer'
import projectsReducer from './reducers/projects_reducer'
import searchReducer from './reducers/search_reducer'
import projectStatusReducer from './reducers/project_status_reducer'
import selectedProjectReducer from './reducers/selected_project_reducer'

const reducers = combineReducers({
  deliverables: deliverablesReducer,
  projects: projectsReducer,
  search: searchReducer,
  projectStatus:projectStatusReducer,
  selectedProject:selectedProjectReducer,
});
const composeEnhancers = window.__REDUX_DEVTOOLS_EXTENSION_COMPOSE__ || compose;
const middlewares = composeEnhancers(applyMiddleware(reduxPromise));

// ReactDOM.render(
//   <Provider store={createStore(reducers, {}, middlewares)}>
//     <BrowserRouter>
//       <Routes>
//         <Route path="dashboard" element={<Dashboard />} />
//         <Route path="projects/:projectId">
//             <Route path=":edit" element={<EditProject />} />
//         </Route>
//       </Routes>
//     </BrowserRouter>

//   </Provider>,
//   document.getElementById('dashboard'));
