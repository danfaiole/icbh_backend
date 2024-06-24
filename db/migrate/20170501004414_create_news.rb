class CreateNews < ActiveRecord::Migration[5.0]
  def change
    create_table :news do |t|
      t.string :title, null: false
      t.text :body
      t.attachment :title_image
      t.boolean :published
      t.date :publication_date
      t.references :user, foreign_key: true, null: false
      t.string :tags

      t.timestamps
    end
  end
end
