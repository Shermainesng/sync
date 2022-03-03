import React from 'react';
import Icon from './icon';

function Project(props) {
  const proj = props.proj
  return (
    <div className="col-sm-6 col-md-4 mb-4 card-animation">
      <a id="link" href={`/projects/${proj.id}`} className="btn-deleted">
        <div className="card-white h-100 mb-4">
          <div className="card-custom-body">
            <div className="card-custom-title header-md">
              <p className="pl-0 w-100">{proj.name}</p>
              <div className="d-flex align-items-center mb-3 mt-2">
                <img className="avatar avatar-sm" src={proj.img} alt="avatar"/>
                <div className="card-custom-subtitle header-sm">{proj.brand.name}</div>
              </div>
            </div>

            <div className="card-custom-text">
              {proj.description}
            </div>
            <ul>
              {proj.deliverables.map((deliverable) => <Icon type={deliverable.deliverable_type} key={deliverable.id}/>)}
            </ul>
          </div>
        </div>
      </a>
    </div>
  );
}

export default Project;
