// ACTION CREATORS
const ROOT_URL = '/api/v1';

export const LOAD_DELIVERABLES = 'LOAD_DELIVERABLES';
export const LOAD_PROJECTS = 'LOAD_PROJECTS';
export const UPDATE_SEARCH = 'UPDATE_SEARCH';
export const FILTER_STATUS = 'FILTER_STATUS';
export const FETCH_PROJECT = 'FETCH_PROJECT';


export function loadDeliverables(period) {
  console.log("loading deliverables");
  const promise = fetch(`${ROOT_URL}/deliverables?deliv_by=${period}`)
    .then(response => response.json());
  console.log('loaded deliverables');
  return {
    type: LOAD_DELIVERABLES,
    payload: promise
  };
}

export function loadProjects(params) {
  const status = params.status
  const name = params.name
  // console.log(`${ROOT_URL}/projects?&status=${status}&filter_name=${name}`);

  const promise = fetch(`${ROOT_URL}/projects?&status=${status}&filter_name=${name}`)
    .then(response => response.json());
  console.log('loaded projects');
  return {
    type: LOAD_PROJECTS,
    payload: promise
  };
}

export function updateSearch(value) {
  return {
    type: UPDATE_SEARCH,
    payload: value
  };
}

export function filterStatus(value) {
  return {
    type: FILTER_STATUS,
    payload: value
  };
}

export function fetchProject(id) {
  const promise = fetch(`${ROOT_URL}/${id}`)
    .then(response => response.json());
  return {
    type: FETCH_POST,
    payload: promise
  };
}
