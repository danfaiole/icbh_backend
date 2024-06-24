class CreateAppStatus < ActiveRecord::Migration[5.0]
  def change
    create_table :app_status do |t|
      t.datetime :last_news
      t.datetime :last_event
      t.datetime :last_download
      t.boolean :form_avaliable

      t.timestamps
    end
  end
end
