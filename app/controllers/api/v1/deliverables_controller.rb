class Api::V1::DeliverablesController < ActionController::Base
  def index
    period = params[:deliv_by] #week or month

    add_days = {
      week: 7,
      two_weeks: 14,
      month: 1.month
    }

    filtered_date = Date.today + add_days[period.to_sym]

    deliverables_due = []

    deliverables = current_user.deliverables
                               .where("due_date >= ?", Date.today)
                               .where("due_date <= ?", filtered_date)
                               .order(:due_date)
                               .reject { |deliverable| deliverable.project_status == "saved" }

    deliverables.each do |deliverable|
      deliv = {}
      deliv[:id] = deliverable.id
      deliv[:date] = deliverable.due_date
      deliv[:type] = deliverable.deliverable_type
      deliv[:project] = deliverable.project.name
      deliv[:brand] = Organisation.find(deliverable.project.client_id).name

      deliverables_due << deliv
    end

    render json: deliverables_due
  end
end
