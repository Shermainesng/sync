// ACTION CREATORS
const ROOT_URL = '/api/v1';

export const LOAD_DELIVERABLES = 'LOAD_DELIVERABLES';
export const LOAD_PROJECTS = 'LOAD_PROJECTS';
export const SEARCH = 'SEARCH';
export const FILTER_STATUS = 'FILTER_STATUS';

export function loadDeliverables(period) {
  const promise = fetch(`${ROOT_URL}/deliverables?deliv_by=${period}`)
    .then(response => response.json());

  return {
    type: LOAD_DELIVERABLES,
    payload: promise
  };
}

export function loadProjects(params) {
  const status = params.status
  const name = params.name
  console.log(`${ROOT_URL}/projects?&status=${status}&filter_name=${name}`);

  const promise = fetch(`${ROOT_URL}/projects?&status=${status}&filter_name=${name}`)
    .then(response => response.json());
  console.log(promise);
  return {
    type: LOAD_PROJECTS,
    payload: promise
  };
}

export function updateSearch(value) {
  return {
    type: SEARCH,
    payload: value
  };
}

export function filterStatus(value) {
  return {
    type: FILTER_STATUS,
    payload: value
  };
}
