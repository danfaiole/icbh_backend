class CreateDownloads < ActiveRecord::Migration[5.0]
  def change
    create_table :downloads do |t|
      t.string :title
      t.string :description
      t.attachment :document

      t.timestamps
    end
  end
end
