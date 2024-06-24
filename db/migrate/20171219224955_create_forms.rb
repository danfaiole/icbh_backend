class CreateForms < ActiveRecord::Migration[5.0]
  def change
    create_table :forms do |t|
      t.string :title, null: false
      t.string :help_text
      t.boolean :active, null: false, default: false
      t.jsonb :fields
      t.date :start_date, null: false
      t.date :end_date

      t.timestamps
    end
  end
end
