class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.belongs_to :from_user, foreign_key: { to_table: :users }
      t.belongs_to :to_user, foreign_key: { to_table: :users }
      t.text :content

      t.timestamps
    end
  end
end
