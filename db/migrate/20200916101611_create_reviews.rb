class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :senior, foreign_key: { to_table: :users }
      t.references :junior, foreign_key: { to_table: :users }
      t.integer :star
      t.text :content

      t.timestamps
      t.index [:junior_id, :senior_id], unique: true
    end
  end
end
