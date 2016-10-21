class CreatePostTaggings < ActiveRecord::Migration[5.0]
  def change
    create_table :post_taggings do |t|
      t.belongs_to :post, foreign_key: true
      t.belongs_to :post_tag, foreign_key: true

      t.timestamps
    end
  end
end
