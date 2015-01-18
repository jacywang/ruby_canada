class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :body
      t.integer :user_id, :topic_id

      t.timestamps
    end
  end
end
