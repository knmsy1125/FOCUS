class CreateFans < ActiveRecord::Migration[5.2]
  def change
    create_table :fans do |t|
      t.integer :user_id,   null: false #ユーザーID
      t.integer :sopporter, null: false #応援する側
      t.timestamps
    end
  end
end
