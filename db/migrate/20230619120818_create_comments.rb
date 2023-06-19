class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :rating
      t.string :positive
      t.string :negative
      t.integer :date
      t.references :user, null: false, foreign_key: true
      t.references :race, null: false, foreign_key: true
      t.timestamps
    end
  end
end
