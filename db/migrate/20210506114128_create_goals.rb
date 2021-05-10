class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.integer :user_id, null: false #ユーザーID
      t.text :name                    #ゴールフォーカス名前
      t.date :end_on                  #エンド日
      t.timestamps                    #（created_at → スタート日）
    end
  end
end
