class ChangeStringToText < ActiveRecord::Migration[5.0]
  def change
    change_column :forms, :help_text, :text
  end
end
