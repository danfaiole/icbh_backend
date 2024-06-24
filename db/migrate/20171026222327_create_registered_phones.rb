class CreateRegisteredPhones < ActiveRecord::Migration[5.0]
  def change
    create_table :registered_phones do |t|
      t.string :phone_id, null: false, index: true

      t.timestamps
    end
  end
end
