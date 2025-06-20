class Moves < ActiveRecord::Migration[8.0]
  def change
    create_table :moves do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.boolean :optional,

      t.timestamps
    end
  end
end
