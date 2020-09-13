class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.references :link, foreign_key: true
      t.text :message
      t.string :source

      t.timestamps
    end
  end
end
