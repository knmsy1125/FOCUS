class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.references :goal, foreign_key: true,  null: false # タスクリストID
      t.string :title                                     # タスク名前
      t.text :body                                        # タスク詳細

      t.timestamps
    end
  end
end
