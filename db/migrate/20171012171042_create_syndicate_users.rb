class CreateSyndicateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :syndicate_users do |t|
      t.integer :syndicate_id
      t.integer :user_id

      t.timestamps
    end
  end
end
