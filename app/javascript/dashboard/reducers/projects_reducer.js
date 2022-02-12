import { LOAD_PROJECTS } from '../actions';

const projectsReducer = (state=[], action) => {
  switch(action.type) {
    case LOAD_PROJECTS:
      return action.payload
    default:
      return state
  }
};
export default projectsReducer;
