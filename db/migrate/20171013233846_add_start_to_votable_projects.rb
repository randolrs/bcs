class AddStartToVotableProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :votable_projects, :start_time, :datetime
    add_column :votable_projects, :end_time, :datetime
  end
end
