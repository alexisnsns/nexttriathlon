class CreateRaces < ActiveRecord::Migration[7.0]
  def change
    create_table :races do |t|
      t.string :title
      t.text :description
      t.text :format, array: true
      t.string :organizer
      t.string :link
      t.string :swim
      t.string :bike
      t.string :run
      t.datetime :date, using: 'date::timestamp without time zone'
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
