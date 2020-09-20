class ChangeGradeToUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :grade, :string
  end
end
