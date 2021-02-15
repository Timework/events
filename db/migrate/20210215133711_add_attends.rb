class AddAttends < ActiveRecord::Migration[6.1]
  def change
    create_table :attends do |t|
      t.integer :attended_event_id
      t.integer :attendee_id

      t.timestamps
    end
  end
end
