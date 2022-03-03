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
  const three_days_later = moment().add(3, 'days')
  const urgent = three_days_later > moment(deliv.date, "YYYY-MM-DD")
  const cardClass = urgent ? "card-flat-urgent" : 'card-flat'
  return(
    //urgent logic
    <div className={`${cardClass} border my-1 py-1 card-animation`} >
      <a className="deliverable-card">
        <div>{deliv.date}</div>
        <div>{deliv.brand}</div>
        <div class="truncate">{deliv.project}</div>
        <div>{deliv.type}</div>
        <div className="truncate">tags</div>
      </a>
    </div>
  );
}

export default Deliverable;
