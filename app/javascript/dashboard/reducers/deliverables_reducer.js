import { LOAD_DELIVERABLES } from '../actions';

const deliverablesReducer = (state=[], action) => {
  switch(action.type) {
    case LOAD_DELIVERABLES:
      return action.payload
    default:
      return state
  }
};
export default deliverablesReducer;
