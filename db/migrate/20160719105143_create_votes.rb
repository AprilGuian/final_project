class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.references :user, foreign_key: true
      t.references :candidate, foreign_key: true
      t.text :comment

      t.timestamps
    end
  end
end
