class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :value, default: 0
      t.references :user, null: false

      t.timestamps null: false
    end
  end
end
