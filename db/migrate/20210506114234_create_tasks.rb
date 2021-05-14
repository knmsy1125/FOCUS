class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.integer :weight_id                                #ウェイトID
      t.references :goal, foreign_key: true,  null: false #タスクリストID
      t.integer :count                                    #できたときの判定
      t.integer :count_out                                #できなかった時の判定
      t.string :title                                     #タスク名前
      t.text :body                                        #タスク詳細
      t.timestamps
    end
  end
end
