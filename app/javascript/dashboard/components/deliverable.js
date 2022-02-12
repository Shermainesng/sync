import React from 'react';
import moment from 'moment';

function Date(props) {
  return(
    <div>
      {moment(props.date).format('MMM D, ddd')}
    </div>
  );
}
function Deliverable(props) {
  const deliv = props.deliverable
  return(
    //urgent logic
    <div className="card-flat border my-1 py-1 card-animation d-flex justify-content-between" >
      <li>{deliv.date}</li>
      <div>{deliv.brand}</div>
      <div>{deliv.project}</div>
      <div>{deliv.type}</div>
      <div>tags</div>
    </div>
  );
}

export default Deliverable;
