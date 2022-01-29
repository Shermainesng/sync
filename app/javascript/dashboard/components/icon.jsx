import { array } from 'prop-types';
import React from 'react';


function Icon(props) {
  const deliverable = props.type;
  let icon = "";

  switch (deliverable.toLowerCase()) {
    case ("instagram" || "ig"):
      icon = "instagram"
      break;
    case ("tiktok" || "tt" || "tik tok"):
      icon = "tiktok"
      break;
    case "youtube":
      icon = "youtube"
      break;
    default:
      icon = "hashtag";
  }

  const iconClass = "fab fa-" + icon;
  return (
    <li><i className={iconClass}/>{deliverable}</li>
  );
}

export default Icon;
