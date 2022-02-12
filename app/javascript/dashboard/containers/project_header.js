import React from 'react';


function ProjectHeader(props) {
    return (
      <form className="simple_form card-white custom-form-card" id="edit_project_27" novalidate="novalidate" action="/projects/27" accept-charset="UTF-8" method="post">
        <input type="hidden" name="_method" value="patch"/>
        <input type="hidden" name="authenticity_token" value="9ua8yGpLfCRDA5WLOzGzW-HIV7yEDBjHK-h_g9ZHOeDYtvJetdazOB38npIzrJ-takIYWD8hee0l9CqVlROIog"/>
        <div className="new-project-form">
          <div className="form-group string optional project_name">
            <input className="form-control string optional borderless-input" placeholder="Project name" type="text" value="" name="project[name]" id="project_name"/>
          </div>
          <div className="form-group text optional project_description">
            <textarea className="form-control text optional borderless-input" placeholder="Project description" name="project[description]" id="project_description">
            </textarea>
          </div>
          <div className="form-group">
            <label for="project_end">Project end:</label>
            <input type="date" id="project_end" name="project_end" className="form-control" value="2022-02-12" min="2022-02-12" max="2023-02-12"/>
          </div>
        </div>
        <button type="button" className="submit-form-btn" data-toggle="modal" data-target="#popupModal">
          Share project
        </button>
      </form>
    );
}

export default ProjectHeader;
