import React, { Component } from 'react';

const Date = (props) => {
  return (
    <div>
        {/* {moment(props.date).format("MMM D, ddd")} */}
        {props.date}
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

  class Deliverable extends Component {
  render(){
    return (
      <div className="card-white-and-date mx-auto">
        {this.props.date}
        <div className="card-deliverable-content pt-1">
        {this.props.description}
        </div>
      </div>
    );
  }
};

export default Deliverable;
