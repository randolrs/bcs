class CreateVotableProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :votable_projects do |t|
      t.string :headline
      t.string :sub_headline
      t.text :reason_selected
      t.text :additional_information

      t.timestamps
    end
  end
end
