class CreateRegistrations < ActiveRecord::Migration[7.0]
  def change
    create_table :registrations do |t|
      t.references :Users, null: false, foreign_key: true
      t.references :Events, null: false, foreign_key: true

      t.timestamps
    end
  end
end
