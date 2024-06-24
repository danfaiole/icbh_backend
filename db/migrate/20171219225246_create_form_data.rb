class CreateFormData < ActiveRecord::Migration[5.0]
  def change
    create_table :form_data do |t|
      t.references :form, foreign_key: true, null: false
      t.jsonb :data, null: false

      t.timestamps
    end
  end
end
