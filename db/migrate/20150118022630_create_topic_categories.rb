class CreateTopicCategories < ActiveRecord::Migration
  def change
    create_table :topic_categories do |t|
      t.integer :topic_id, :category_id

      t.timestamps
    end
  end
end
