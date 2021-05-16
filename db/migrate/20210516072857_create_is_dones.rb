class CreateIsDones < ActiveRecord::Migration[5.2]
  def change
    create_table :is_dones do |t|
      t.references :task, foreign_key: true,  null: false
      t.date :execution
      t.timestamps
    end
  end
end
