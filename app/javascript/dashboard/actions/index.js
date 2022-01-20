// ACTION CREATORS
const ROOT_URL = '/api/v1';

export const LOAD_DELIVERABLES = 'LOAD_DELIVERABLES';
export const LOAD_PROJECTS = 'LOAD_PROJECTS';

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
  const promise = fetch(`${ROOT_URL}/projects?&status=${status}&filter_name=${name}`)
    .then(response => response.json());

  return {
    type: LOAD_PROJECTS,
    payload: promise
  };
}
