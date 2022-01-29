import { FILTER_STATUS } from '../actions';

const projectStatusReducer = (state="", action) => {
  switch(action.type) {
    case FILTER_STATUS:
      return action.payload
    default:
      return state
  }
};
export default projectStatusReducer;
