class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :event_name
      t.string :event_description
      t.datetime :start_date_time
      t.datetime :end_date_time
      t.string :event_picture
      t.timestamps
    end
  end
end
