class AddProfileToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :school, :string
    add_column :users, :department, :string
    add_column :users, :subject, :string
    add_column :users, :grade, :integer
    add_column :users, :age, :integer
    add_column :users, :content1, :text
    add_column :users, :content2, :text
    add_column :users, :content3, :text
    add_column :users, :content4, :text
  end
end
