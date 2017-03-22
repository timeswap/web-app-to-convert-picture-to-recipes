class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.string :ingredients, null: false
      t.string :photo_url

      t.timestamps null: false
    end
  end
end
