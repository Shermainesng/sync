import { array } from 'prop-types';
import React from 'react';


function Icon(props) {
  const deliverable = props.type;
  let icon = "";

  switch (deliverable.toLowerCase()) {
    case ("instagram" || "ig"):
      icon = "fab fa-instagram"
      break;
    case ("tiktok" || "tt" || "tik tok"):
      icon = "fab fa-tiktok"
      break;
    case "youtube":
      icon = "fab fa-youtube"
      break;
    default:
      icon = "fas fa-hashtag";
  }
  return (
    <li><i className={icon}/>{deliverable}</li>
  );
}

export default Icon;
