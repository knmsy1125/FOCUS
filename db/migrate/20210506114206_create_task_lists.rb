class CreateTaskLists < ActiveRecord::Migration[5.2]
  def change
    create_table :task_lists do |t|
      t.integer :goal_id,    null: false #ゴールID
      t.string :total_score, null: false #タスク総合計
      t.timestamps
    end
  end
end
