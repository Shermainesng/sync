import React, { Component } from 'react';

const Date = (props) => {
  return (
    <div>
      {moment(props.date).format("MMM D, ddd")}
    </div>
  );
}

const Description = (props) => {
  return (
    <div className="card-custom-title">
      <p className="truncate">
        {props.description}
      </p>
    </div>
  );
}

const Deliverable = (props) => {
  return (
    <div className="card-white-and-date mx-auto">
      <Date date={props.date}/>
      <div class="card-deliverable-content pt-1">
        <Description description={props.description}/>
      </div>
    </div>
  );
};

export default Deliverable;
