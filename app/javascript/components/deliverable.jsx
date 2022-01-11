import React, { Component } from 'react';

const Date = (props) => {
  return (

  );
}

const Deliverable = (props) => {
  return (
    <div className="card-white-and-date mx-auto">
      <Date date={props.date}/>

    </div>
  );
};

export default Deliverable;
