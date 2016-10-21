class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.integer :stars
      t.text :comment
      t.belongs_to :course, foreign_key: true
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
