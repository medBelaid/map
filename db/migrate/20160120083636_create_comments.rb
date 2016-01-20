class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :text
      t.integer :rate
      t.references :user, index: true, foreign_key: true
      t.references :recipe, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
