class AddPublishedToVotableProject < ActiveRecord::Migration[5.0]
  def change
    add_column :votable_projects, :published, :boolean
  end
end
