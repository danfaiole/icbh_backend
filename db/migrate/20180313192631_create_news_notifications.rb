class CreateNewsNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :news_notifications do |t|
      t.references :news, foreign_key: true
      t.references :delayed_jobs
      t.datetime :date
      t.string :title
      t.string :body

      t.timestamps
    end
  end
end
