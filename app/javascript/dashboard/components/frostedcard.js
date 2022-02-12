import React from 'react';


function FrostedCard(props) {
  return (
    <div className={"card-frosted "+props.classes}>
      {props.children}
    </div>
  )
}

export default FrostedCard;
