class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.datetime :start_date, null: false, index: true
      t.datetime :end_date, null: false, index: true
      t.string :title, null: false
      t.string :color, null: false, default: 'blue'
      t.string :description
      t.string :location

      t.timestamps
    end
  end
end
