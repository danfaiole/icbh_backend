class CreateEventNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :event_notifications do |t|
      t.references :event, foreign_key: true, null: false
      t.references :delayed_jobs
      t.datetime :date, null: false
      t.string :title, null: false
      t.string :body, null: false

      t.timestamps
    end
  end
end
