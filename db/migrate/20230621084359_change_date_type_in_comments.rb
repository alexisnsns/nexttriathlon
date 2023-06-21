class ChangeDateTypeInComments < ActiveRecord::Migration[7.0]
  def change
    change_column :comments, :date, :string
  end
end
