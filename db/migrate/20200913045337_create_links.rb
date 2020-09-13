class CreateLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :links do |t|
      t.references :junior, foreign_key: { to_table: :users }
      t.references :senior, foreign_key: { to_table: :users }
      t.string :chat
      t.string :uuid, unique: true

      t.timestamps
      t.index [:junior_id, :senior_id], unique: true
    end
  end
end
