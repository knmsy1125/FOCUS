class CreateFans < ActiveRecord::Migration[5.2]
  def change
    create_table :fans do |t|

      t.timestamps
    end
  end
end
