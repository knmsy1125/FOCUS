class CreateUserComments < ActiveRecord::Migration[5.2]
  def change
    create_table :user_comments do |t|
      t.integer :user_id,     null: false #ユーザーID
      t.integer :commentator_id              #コメントする側
      t.text :comment                     #コメント
      t.timestamps
    end
  end
end
