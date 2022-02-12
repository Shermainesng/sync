import { FETCH_PROJECT } from '../actions';

const selectedProjectReducer = (state=[], action) => {
  switch(action.type) {
    case FETCH_PROJECT:
      return action.payload;
    default:
      return state
  }
};
export default selectedProjectReducer;
