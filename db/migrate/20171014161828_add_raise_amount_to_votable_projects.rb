class AddRaiseAmountToVotableProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :votable_projects, :raise_amount, :decimal
  end
end
