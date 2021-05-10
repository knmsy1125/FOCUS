class CreateWeights < ActiveRecord::Migration[5.2]
  def change
    create_table :weights do |t|
      t.string :name #ウェイト名前
      t.timestamps
    end
  end
end
