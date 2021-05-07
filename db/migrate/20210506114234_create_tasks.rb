class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.integer :weight_id,    null: false #ウェイトID
      t.integer :task_list_id, null: false #タスクリストID
      t.integer :count,        null: false #できたときの判定
      t.integer :count_out,    null: false #できなかった時の判定
      t.string :title,         null: false #タスク名前
      t.text :boby,            null: false #タスク詳細
      t.timestamps
    end
  end
end
