class CreateVideos < ActiveRecord::Migration[5.0]
  def change
    create_table :videos do |t|
      t.string :url, null: false
      t.attachment :thumbnail
      t.string :title, null: false
      t.string :description
      t.boolean :published, default: false
      t.date :publication_date

      t.timestamps
    end
  end
end
