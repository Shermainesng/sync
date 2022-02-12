import React from 'react';
import moment from 'moment';
import Icon from './icon';


function DetailedDeliverable(props) {
  const deliv = props.deliverable
  return(
    //urgent logic
  <div className="deliverable-edit p-1 m-1 card-white">
    <div className="deliverable-edit-date">
      {deliv.due_date}
    </div>

    <div className="card-deliverable-content">
      <div className="card-custom-title">
        <Icon type={deliv.deliverable_type} />
      </div>
      <div>
        {deliv.description}
      </div>
      <div>
        tags
      </div>
    </div>
  </div>
  );
}

export default DetailedDeliverable;
