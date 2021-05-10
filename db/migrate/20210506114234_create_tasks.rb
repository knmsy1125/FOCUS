class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.integer :weight_id                 #ウェイトID
      t.integer :task_list_id, null: false #タスクリストID
      t.integer :count                     #できたときの判定
      t.integer :count_out                 #できなかった時の判定
      t.string :title                      #タスク名前
      t.text :boby                         #タスク詳細
      t.timestamps
    end
  end
end
