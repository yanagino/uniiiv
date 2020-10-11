class AddNoticeToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :notice, :string
  end
end
