class AddApplicationToVotableProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :votable_projects, :funding_application_submission_id, :integer
  end
end
