import { LOAD_PROJECTS, FETCH_PROJECT } from '../actions';

const projectsReducer = (state=[], action) => {
  switch(action.type) {
    case LOAD_PROJECTS:
      return action.payload
    case FETCH_PROJECT:
      return action.payload;
    default:
      return state
  }
};
export default projectsReducer;
